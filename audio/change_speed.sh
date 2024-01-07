#/bin/sh
set -e

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file_path> <output_dir> <speed-factor>"
    echo "       Output filename will be: output_dir/input_filename_speed.wav"
    exit 1
fi

input="$1"
output="$2"
speed="$3" 

input_filename=$(basename -- "$input")
filename_no_ext="${input_filename%.*}"
extension="${input##*.}"

ffmpeg -i "$input" -filter:a "asetrate=44100*${speed}" "${output}/${filename_no_ext}_${speed}.${extension}"