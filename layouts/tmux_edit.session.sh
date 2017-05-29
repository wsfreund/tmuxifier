# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
session='tmux-edit'
if initialize_session "$session"; then
  ########################################################################
  window_root="$HOME/DotFiles"
  new_window
  run_cmd 'MANUAL_TITLE=DotFiles'
  run_cmd 'vim -p tmux/tmux.conf'
  split_v 10
  select_pane 0
  ########################################################################
  window_root="$HOME/.tmuxifier"
  new_window
  run_cmd 'MANUAL_TITLE=tmuxifier'
  run_cmd 'vim -p layouts/* lib/layout-helpers.sh'
  ########################################################################
  window_root="$HOME/.tmux/plugins/tmux-sessionist"
  new_window
  run_cmd 'MANUAL_TITLE=sessionist'
  run_cmd 'vim -p scripts/* sessionist.tmux'
  ########################################################################
  new_window
  run_cmd 'man tmux'
  ########################################################################
  new_window
  ########################################################################

  htop_window
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
