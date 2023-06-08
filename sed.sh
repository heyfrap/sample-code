find ./ -name "*.rb" -print | xargs sed -i '' -E 's/its\(\:(.*)\)\ \{ is_expected.to eq (.*) \}/it \{ is_expected.to have_attributes(\1: \2) \}/g'

