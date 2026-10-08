#!/bin/bash

# Read the mounted token when a Bash session starts, without storing its value.
# Keep an existing environment key and tolerate workspaces without the mount.
api_key_export='if [ -z "${OPENAI_API_KEY:-}" ] && [ -r /home/renku/work/api-token/api_token.txt ]; then export OPENAI_API_KEY="$(cat /home/renku/work/api-token/api_token.txt)"; fi'
touch "$HOME/.bashrc"
if ! grep -Fqx "$api_key_export" "$HOME/.bashrc"; then
    printf '\n%s\n' "$api_key_export" >> "$HOME/.bashrc"
fi

uv pip install -e hands-on-exercises
