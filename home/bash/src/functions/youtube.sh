function youtube_download {
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o "$1.mp4" https://www.youtube.com/watch?v=$1
  ffmpeg -i "$1.mp4" -c copy -an "$1-no-sound.mp4"
}

