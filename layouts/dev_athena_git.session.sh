# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root $WORK/Ringer/OfflineFramework/source

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
ATHENA_SETUP="20.20.X-VAL,rel_5,here,setup"

session='dev-ringer-athena-git'
if initialize_session "$session"; then
  ######################################################################## 
  new_window "Work"
  run_cmd "setAthena \"$ATHENA_SETUP\""
  ######################################################################## 
  vim_athena_dev_window "CRings++" "Event/xAOD/xAODCaloRings" ""
  ######################################################################## 
  vim_athena_dev_window "CRingsP++" "Event/xAOD/xAODCaloRingsAthenaPool" ""
  ######################################################################## 
  vim_athena_dev_window "egRec++" "Reconstruction/egamma/egammaRec" ""
  ######################################################################## 
  vim_athena_dev_window "CRAlg++" "Reconstruction/RecoAlgs/CaloRingerAlgs" ""
  ######################################################################## 
  vim_athena_dev_window "egTool++" "Reconstruction/egamma/egammaTools" ""
  ######################################################################## 
  vim_athena_dev_window "CRTool++" "Reconstruction/RecoTools/CaloRingerTools" ""
  ######################################################################## 
  vim_athena_dev_window "ESel++" "PhysicsAnalysis/ElectronPhotonID/ElectronPhotonSelectorTools" ""
  ######################################################################## 
  vim_athena_dev_window "RSel++" "PhysicsAnalysis/RingerSelectorTools" ""
  ######################################################################## 
  new_window "JO++"
  run_cmd "cd ../run"
  run_cmd "setAthena \"$SCREEN_XAOD_ASETUP\""
  run_cmd "vim CaloRinger_skeleton.py"
  ######################################################################## 
  new_window "RootCore++"
  run_cmd "cd $WORK/public/TestTrigRinger"
  run_cmd "source rcSetup.sh"
  ######################################################################## 

  ######################################################################## 
  htop_window
  ensure_kinit_voms_window
  ######################################################################## 
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
