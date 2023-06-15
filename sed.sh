find /path/to/your/directory -name '*.rb' -exec sed -E -i '' '/to_s\.to_d/!s/\bto_d\b/to_s.to_d/g' {} \;
