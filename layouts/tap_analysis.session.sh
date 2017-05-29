# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root $HOME/Ringer/xAODRingerOfflinePorting/RingerTPFrameWork

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
session='T&P'
if initialize_session "$session"; then
  ######################################################################## 
  new_window "Work"
  run_cmd 'source setrootcore.sh'
  #[ \! -d "/tmp/$USER/" ] && mkdir -p "/tmp/$USER/"
  #run_cmd "tmux pipe-pane \"cat >> /tmp/wsfreund/${session}_work.pipe\""
  ######################################################################## 
  vim_rootcore_dev_window "TTool-" "TuningTools" "10"
  ######################################################################## 
  vim_rootcore_dev_window "RCore-" "RingerCore" "20"
  ######################################################################## 
  vim_dev_window "RCM-" "30" "cd $session_root/RootCoreMacros" "" true
  ######################################################################## 
  vim_rootcore_dev_window "T&P-" "TagAndProbeFrame" "40"
  ######################################################################## 
  vim_rootcore_dev_window "ID-" "ElectronIDDevelopment" "50"
  ######################################################################## 
  vim_rootcore_dev_window "rSel-" "RingerSelectorTools" "60"
  ######################################################################## 
  #window_root="$HOME/Ringer/xAODRingerOfflinePorting/source/PhysicsAnalysis/ElectronPhotonID/ElectronPhotonSelectorTools/"
  #vim_dev_window "eSel-" "70" "source $HOME/Ringer/xAODRingerOfflinePorting/RingerTPFrameWork/setrootcore.sh" ":let &makeprg=\"rc compile_pkg ElectronPhotonSelectorTools\""
  vim_rootcore_dev_window "eSel-" "ElectronPhotonSelectorTools" "70"
  ######################################################################## 
  vim_rootcore_dev_window "CRings-" "xAODCaloRings" "80"
  ######################################################################## 

  htop_window
  ensure_kinit_voms_window

  # Select the default active window on session creation.
  select_window "Work"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
