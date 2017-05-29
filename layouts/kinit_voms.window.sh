# Create new window. If no argument is given, window name will be based on
# layout file name.
[ -z "$name" ] && window="kinit_voms"
new_window $name
run_cmd "MANUAL_TITLE=$name"
run_cmd "KinitOn.sh"
if test -f "$HOME/scripts/keep_kinit_on.sh"; then
  run_cmd 'source $HOME/scripts/keep_kinit_on.sh &'
fi
if test -f "$HOME/scripts/keep_voms_on.sh"; then
  run_cmd 'source $HOME/scripts/keep_voms_on.sh &'
fi
true
