#!/usr/bin/env bash

##############################################################################################
# Wrapper around `semtag getcurrent` to sanitize output so that it can be used as a docker tag.
##############################################################################################

script_path=$(dirname "$0")
echo $($script_path/sanitize_docker_tag.sh $($script_path/semtag getcurrent))
