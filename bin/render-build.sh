# bin/render-build.sh
#!/usr/bin/env bash
set -o errexit
bundle install -j $(nproc)
bin/rails db:migrate
bin/rails post_setup_instructions:perform
bin/rails assets:precompile