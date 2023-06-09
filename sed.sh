find ./ -name "*.rb" -print | xargs sed -i '' -E 's/its\(\:(.*)\)\ \{ is_expected.to eq (.*) \}/it \{ is_expected.to have_attributes(\1: \2) \}/g'
find ./ -name "*.rb" -print | xargs sed -i '' -E 's/its\(\:(.*)\)\ \{ is_expected.to eq (.*)\.\.(.*) \}/it \{ is_expected.to have_attributes(\1: \2..\3) \}/g'

sed -i '' -E 's/its\(\:(.*)\)\ \{is_expected.to eq (.*)\.\.(.*) \}/it \{ is_expected.to have_attributes(\1: \2..\3) \}/g' target_file.rb
find ./ -name "*.rb" -print | xargs sed -i '' -E 's/its\(\:(.*)\)\ \{is_expected.to eq (.*)\.\.(.*) \}/it \{ is_expected.to have_attributes(\1: \2..\3) \}/g'
find ./ -name "*.rb" -print | xargs sed -i '' -E 's/its\(\:(.*)\)[[:space:]]*\{[[:space:]]*is_expected.to[[:space:]]*eq[[:space:]]*(.*)[[:space:]]*\}/it \{ is_expected.to have_attributes(\1: \2) \}/g'

find ./ -name "*.rb" -print | xargs sed -i '' -E 's/its\(\:(.*)\)[[:space:]]*\{[[:space:]]*is_expected.to[[:space:]]*be_present[[:space:]]*\}/it \{ is_expected.to be_present \}/g'


