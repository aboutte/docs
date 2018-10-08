# download a list of videos from txt file

youtube-dl --playlist-reverse --download-archive ./downloaded -i -o "%(uploader)s/%(playlist)s/%(playlist)s - S01E%(playlist_index)s - %(title)s [%(id)s].%(ext)s" -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --merge-output-format mp4 --add-metadata --write-thumbnail --batch-file=./download


# download a youtube playlist

youtube-dl -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --merge-output-format mp4 --add-metadata -o "%(uploader)s/%(playlist)s/%(playlist)s - S01E%(playlist_index)s - %(title)s [%(id)s].%(ext)s"



youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=PL3LShjVgtVOh1bQJYyl_78iGwFLOZqcyA