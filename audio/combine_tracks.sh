#!/bin/bash
set -e

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <vocal_file> <instrumental_file> <output_file>"
    exit 1
fi

vocal_file="$1"
instrumental_file="$2"
output_file="$3"

ffmpeg -i "$vocal_file" -i "$instrumental_file" -filter_complex amix=inputs=2:duration=longest "$output_file"

echo "Overlay complete. Output saved as $output_file."
