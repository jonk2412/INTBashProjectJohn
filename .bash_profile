#echo "Hallo $USER"
echo "Hello myuser"

HOME_DIR="$HOME"
if [ -f "$HOME_DIR/.token" ]; then
  PERMISSIONS=$(stat -c "%a" "$HOME_DIR/.token")
  if [ "$PERMISSIONS" != "600" ]; then
    echo "Warning: .token file has too open permissions"
  fi
fi

umask 002

export COURSE_ID="__REPO_NAME__"
export PATH="$PATH:/home/$USER/usercommands"
current_time=$(date -u '+%Y-%m-%dT%H:%M:%S+00:00')
echo "The current date is: $current_time"

alias ltxt='ls *.txt'

tmp_dir="$HOME/tmp"
if [ ! -d "$tmp_dir" ]; then
  mkdir -p "$tmp_dir"
else rm -rf "$HOME/tmp"/*
fi

# Kill process listening on port 8080
kill -9 $(lsof -t -i :8080) 2>/dev/null
#test