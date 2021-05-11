#!/usr/bin/env sh

set -eu

# Install bump-cli
npm install -g bump-cli

# For each file from the available `*.json` files
for api in spec/json/twilio*.json; do
    # Extract the API name from filename `twilio_<api_name>_vN.json`
    apiName="${api%_*}"
    apiName="${apiName#*_}"

    # Create documentation <apiName> from the api definition file into a single Bump Hub
    bump deploy --doc "${apiName}" --token "${BUMP_TOKEN}" --hub twilio --auto-create "${api}"
done
