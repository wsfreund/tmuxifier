# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root $HOME/Ringer/xAODRingerOfflinePorting/RingerTPFrameWork

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
session='example'
set -x
if initialize_session "$session"; then
  ######################################################################## 
  new_window "Work"
  split_vl 15 0
  split_hl 47 1
  select_pane 0
  run_cmd 'source ./setrootcore.sh'
  #run_cmd 'rc compile'
  select_pane 2
  #run_cmd 'unset TMUX'
  #run_cmd 'tmux attach -t "shared:htop"'
  #run_cmd 'tail -f /tmp/wsfreund/htop'
  select_pane 0
  ######################################################################## 
  vim_rootcore_dev_window "TTool" "TuningTools" "30"
  ######################################################################## 
  vim_dev_window "RCM" "30" "cd $session_root/RootCoreMacros" "" true

  htop_window
  ensure_kinit_voms_window

  # Select the default active window on session creation.
  select_window "Work"
fi

set +x

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
