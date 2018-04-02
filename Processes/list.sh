# https://www.cyberciti.biz/faq/what-process-has-open-linux-port/
#list all processes of ng   https://www.cyberciti.biz/faq/kill-process-in-linux-or-terminate-a-process-in-unix-or-linux-systems/
ps aux | grep ng
# find processes by port
sudo ss -lptn 'sport = :80'
sudo netstat -nlp | grep :80
sudo lsof -n -i :80 | grep LISTEN
sudo lsof -n -i -P | grep mongo
lsof -n -i4TCP:$PORT | grep LISTEN
lsof -n -iTCP:$PORT | grep LISTEN
lsof -n -i:$PORT | grep LISTEN
#fuser -v -n tcp 22
# list all pid of ng
pidof ng
# kill the list of all pids of ng
for pid in $(pidof ng); do kill -9 $pid; done
pidof ng | killall -9
