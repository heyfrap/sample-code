find . -name '*.rb' -exec sed -i -E '/to_s\.to_d/!s/to_d/to_s.to_d/g' {} \;

