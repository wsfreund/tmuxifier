# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
if [ "$(hostname -d)" = "cern.ch" ]; then
  session_root $HOME/public/RingerProject/root
elif [ "$(hostname -s)" = "cessy" ]; then
  session_root $HOME/RingerProject_cessy/root
elif [ "$(hostname -s)" = "annecy" ]; then
  session_root $HOME/RingerProject_annecy/root
else
  echo "ERROR: Couldn't determine session root by hostname." >&2 && return 1;
fi

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
session='RingerProject'
if initialize_session "$session"; then

  ######################################################################## 
  new_window "Work"
  run_cmd 'source setrootcore.sh'
  #[ \! -d "/tmp/$USER/" ] && mkdir -p "/tmp/$USER/"
  #run_cmd "tmux pipe-pane \"cat >> /tmp/wsfreund/${session}_work.pipe\""
  ######################################################################## 
  vim_rootcore_dev_window "TTool" "TuningTools" "10"
  ######################################################################## 
  vim_rootcore_dev_window "RCore" "RingerCore" "20"
  ######################################################################## 
  vim_dev_window "RCM" "30" "cd $session_root/RootCoreMacros" "" true
  ######################################################################## 
  window_root="$HOME/Ringer/xAODRingerOfflinePorting/source/PhysicsAnalysis/RingerSelectorTools/"
  vim_dev_window "egRingerSel" "40" "source $session_root/setrootcore.sh" ":let &makeprg=\"rc compile_pkg RingerSelectorTools\""
  ######################################################################## 
  window_root="$HOME/Ringer/xAODRingerOfflinePorting/source/PhysicsAnalysis/ElectronPhotonID/ElectronPhotonSelectorTools/"
  vim_dev_window "egSel" "50" "source $session_root/setrootcore.sh" ":let &makeprg=\"rc compile_pkg ElectronPhotonSelectorTools\""
  ######################################################################## 
  window_root="$HOME/Ringer/xAODRingerOfflinePorting/source/Event/xAOD/xAODCaloRings/"
  vim_dev_window "CRings" "60" "source $session_root/setrootcore.sh" ":let &makeprg=\"rc compile_pkg xAODCaloRings\""
  ######################################################################## 

  htop_window
  ensure_kinit_voms_window

  # Select the default active window on session creation.
  select_window "Work"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
