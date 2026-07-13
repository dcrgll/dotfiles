# Listening TCP ports
ports() {
  lsof -nP -iTCP -sTCP:LISTEN
}

# Default gateway (router) IP
router() {
  route -n get default | awk '/gateway:/{print $2}'
}

# Private IP of the default interface
ip-private() {
  local iface
  iface="$(route -n get default 2>/dev/null | awk '/interface:/{print $2}')"
  [[ -n $iface ]] && ipconfig getifaddr "$iface"
}

# Open a Google search
google() {
  local query="$*"
  open "https://www.google.com/search?q=${query// /+}"
}

# mkdir -p and cd into it
mkdircd() {
  mkdir -p "$1" && cd "$1"
}

# Switch to main and pull
main() {
  git switch main && git pull
}
