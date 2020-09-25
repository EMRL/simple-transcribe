#!/usr/bin/env bash
#
# transcribe.sh
#
###############################################################################
# A shell script designed to remove timecode and line breaks from .SRT files,
# and make them (slightly) more readable
#
# Arguments:
#   [input]     Input file to convert, .SRT format
#   [output]    Output filename, if empty will be named transcription.txt
###############################################################################

# Make sure we have an input file to work with
if [[ -z "${1}" ]]; then
  echo "Input file required"
  exit 3
else
  srt_file="${1}"
fi

if [[ -z "${2}" ]]; then 
  txt_file="transcription.txt"
else
  txt_file="${2}"
fi

# Do the work in /tmp
cp "${srt_file}" /tmp/"${srt_file}"

# Process
sed -i -e '/^[0-9]/d' \
  -e '/^[[:space:]]*$/d' \
  /tmp/"${srt_file}"

# Finish up
mv /tmp/"${srt_file}" ./"${txt_file}"
