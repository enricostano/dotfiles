export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

set PATH $HOME/.node_modules/bin $PATH
set PATH /usr/local/bin $PATH

# Load /etc/default/machine
# . /etc/default/machine

# Settings depending on $NRCSTN_MACHINE
# if [ $NRCSTN_MACHINE = "redbooth" ]
#   xrandr --output eDP1 --mode 1680x1050
# end

# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
    exec startx -- -keeptty
  end
end
