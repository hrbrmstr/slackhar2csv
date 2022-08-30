#!/bin/bash

# Turns a HAR file saved from Developer Tools' "Network" tab — after scrolling
# history in a Slack channel — to a CSV of timestamped channel messages.

if [ $# != 2 ]; then
	echo "Usage: ${0} <JSON_INPUT_FILE> <CSV_OUTPUT_FILE>"
	exit -1
fi

INPUT=${1}
OUTPUT=${2}

JQ=$(command -v jq)

cat ${INPUT} | ${JQ} '
.log.entries[].response.content | 
  select (.mimeType == "application/json") | .text | fromjson | 
    select(length == 8) | 
      select(.messages) | .messages[].ts |= ( tonumber | todateiso8601 ) | 
        .messages[] | 
          [ .ts, .text ] |
           @csv' > ${OUTPUT}
