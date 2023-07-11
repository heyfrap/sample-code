<template>
  <div>
    <video ref="localVideo" autoplay></video>
    <video ref="remoteVideo" autoplay></video>
  </div>
</template>

<script>
import Webex from 'webex';

export default {
  data() {
    return {
      meetingId: '<your_meeting_id>'
    };
  },
  mounted() {
    this.joinMeeting();
  },
  methods: {
    async joinMeeting() {
      try {
        const webex = Webex.init({
          credentials: {
            access_token: '<your_access_token>'
          }
        });

        const meeting = await webex.meetings.getMeetingByType('sipUri', this.meetingId);

        if (!meeting) {
          throw new Error(`No meeting found for ID "${this.meetingId}"`);
        }

        await meeting.join();

        const mediaSettings = {
          receiveVideo: true,
          receiveAudio: true,
          receiveShare: false,
          sendVideo: true,
          sendAudio: true,
          sendShare: false
        };

        const [localStream, remoteStream] = await meeting.getMediaStreams(mediaSettings);

        this.$refs.localVideo.srcObject = localStream;
        this.$refs.remoteVideo.srcObject = remoteStream;

        await meeting.addMedia({
          localShare: localStream,
          mediaSettings
        });

      } catch (err) {
        console.error(err);
      }
    }
  }
};
</script>

