# set -g @fg '#BBBBBB'
# set -g @active_fg '#FFFFFF'
# set -g @highligh '#569CD6'
# set -g @border '#313131'
# set -g @separator '#6A9955'
# set -g @active_border '#666666'

tmux set -g status-style fg='#BBBBBB',bg='default'
tmux set -g pane-border-style fg='#313131'
tmux set -g pane-active-border-style fg='#666666'

# are we zoomed into a pane?
tmux set -g status-left '#[fg=#808080] session: #[fg=#FFFFFF]#S #[fg=#808080]@ #(cd #{pane_current_path}; (git rev-parse --abbrev-ref HEAD; and echo "none"))'
tmux set -g status-left-length 150
tmux set -g window-status-current-format "#[fg=#FFFFFF]#I: #W#{?window_zoomed_flag, #[fg=#569CD6]󰊓 ,}"
tmux set -g window-status-format "#[fg=#808080]#I: #W#{?window_zoomed_flag, 󰊓 ,}"
tmux set -g window-status-separator '#[fg=#6A9955] ● '

tmux set -g message-style bg='#252526',fg='#d4d4d4'
tmux set -g copy-mode-match-style bg='#313244',fg='#fab387'
tmux set -g copy-mode-mark-style bg='#313244',fg='#fab387'
tmux set -g copy-mode-current-match-style bg='#313244',fg='#f9e2af',bold
tmux set -g mode-style bg='#313244',fg='#a6e3a1',bold
tmux set -g popup-style bg=default
tmux set -g popup-border-style bg=default,fg='#569CD6'

tmux set -g window-status-activity-style bg=default,fg='#d4d4d4'

tmux set -g status-right '#[fg=#808080]󰅐 #(TZ=UTC date +%%H:%%M) UTC'
