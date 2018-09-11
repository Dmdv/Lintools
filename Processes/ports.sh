# find port or process by name

port() { lsof -iTCP -sTCP:LISTEN -n -P | egrep "$@|PID"; }
