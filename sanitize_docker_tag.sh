#!/usr/bin/env bash

##############################################################################################
# Utility to sanitize a string so that it can be used as a docker tag. Replaces invalid
# characters with `__` and cuts the length to 128 characters.
#
# Arguments:
#   [1] str (str): String to be sanitized.
#
##############################################################################################

# Test:
# bin/bash/build_docker_tag.sh "Lorem-ipsum dolor--sit amet, consectetur+ adipiscing elit. Sed rutrum mauris quis^ cursus/ pulvinar. Vestibulum vitae magna leo. Pellentesque vitae fusce."
# Should return Lorem-ipsum__dolor--sit__amet____consectetur____adipiscing__elit.__Sed__rutrum__mauris__quis____cursus____pulvinar.__Vestibulum_

# From https://docs.docker.com/engine/reference/commandline/tag/
# A tag name must be valid ASCII and may contain lowercase and uppercase letters, digits, underscores, periods and dashes.
tag_regex="[^a-zA-Z0-9_\.-]"
max_tag_length=128

echo $1 | sed "s@$tag_regex@__@g" | cut -c1-$max_tag_length