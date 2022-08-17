#! /bin/bash
#
# author: Timothy C Arlen
# date:   17 Aug 2022
#

sudo apt-get -y update
sudo apt-get -y upgrade

echo "Now installing packages after upgrade..."
sudo apt-get install -y emacs vim tmux git

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Put in temperature config in tmux
cat > ~/.tmux.conf <<EOF
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'kolach/tmux-temp'

set -g status-right 'temp: #{temp_cpu} | %a %h-%d %H:%M:%S '

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
EOF

echo "DONE! Ready to use emacs, tmux, git!"
