# OPEN PORT FOR LISTENING

nc -l -p 4242

# find port or process by name

port() { lsof -iTCP -sTCP:LISTEN -n -P | egrep "$@|PID"; }

# see what uses what port 

sudo netstat -peanut
sudo netstat -peanut | grep ":8000 "

# lsof Command Examples

sudo lsof -i :8000
sudo lsof -i :22

# To display the list of open ports, enter:

lsof -i

# To display all open files, use:

lsof

# To display all open IPv4 network files in use by the process whose PID is 9255, use:

lsof -i 4 -a -p 9255

# Another example:

lsof -iTCP -sTCP:LISTEN

# netstat command to find open ports

netstat -l

# To display open ports and established TCP connections, enter:

netstat -vatn

# To display only open UDP ports try the following command:

netstat -vaun

# If you want to see FQDN (full dns hostname), try removing the -n flag:

netstat -vat

# FreeBSD/OS X Unix user try the following command:

netstat -na | grep -i LISTEN
netstat -f inet -na | grep -i LISTEN

# A Note About FreeBSD Users
# You can use the sockstat command lists open Internet or UNIX domain sockets, enter:

sockstat
sockstat -l
sockstat -4 -l
sockstat -6 -l
