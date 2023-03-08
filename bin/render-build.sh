# bin/render-build.sh
#!/usr/bin/env bash
set -o errexit
bundle install -j $(nproc)
bin/setup
bin/rails assets:precompile