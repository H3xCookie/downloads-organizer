#!/bin/bash

# Folders
source_fld=$HOME/Downloads
music_fld=$HOME/Music
documents_fld=$HOME/Documents
pictures_fld=$HOME/Pictures
videos_fld=$HOME/Videos

# Extensions
audio=("mp3" "ogg" "wav" "wma" "flac" "aac")
video=("mp4" "mpg" "webm" "gif" "m4p" "m4v" "mov" "avi")
document=("pdf" "doc" "docx" "xlxs" "odt" "tex" "pptx" "txt" "ott")
image=("jpg" "jpeg" "png" "svg" "webp" "xcf" "bmp")

for ext in "${audio[@]}" "${video[@]}" "${document[@]}" "${image[@]}"
do
  find "$source_fld" -type f -name "*.$ext" | while read file
  do
    if [[ "${audio[@]}" =~ "$ext" ]]
    then
      mv "$file" "$music_fld"
      echo "Moving $file to $music_fld"
    elif [[ "${video[@]}" =~ "$ext" ]]
    then
      mv "$file" "$videos_fld"
      echo "Moving $file to $videos_fld"
    elif [[ "${document[@]}" =~ "$ext" ]]
    then
      mv "$file" "$documents_fld"
      echo "Moving $file to $documents_fld"
    elif [[ "${image[@]}" =~ "$ext" ]]
    then
      mv "$file" "$pictures_fld"
      echo "Moving $file to $pictures_fld"
    fi
  done
done

