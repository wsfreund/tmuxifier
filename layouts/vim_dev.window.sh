# Create new window. If no argument is given, window name will be based on
# layout file name.
[ -z "$name" ] && echo "Cannot start vim_dev window with no name." >&2 && return 1;
new_window "$name"
[ -n "$delay" ] && run_cmd "sleep $delay" 
[ -n "$pre_cmd" ] && run_cmd "$pre_cmd"
run_cmd "MANUAL_TITLE=$name"
if $open_all; then
  run_cmd 'vim -p `find -mindepth 1 -type f`'
else
  run_cmd 'vim -p `find -type f -not -path "*/.*" -not -path "*genConf*" -not -path "*pool*" -not -path "*x86*" \( -name "*.py" -o -name "*.cxx" -o -name "*.h" \)`'
fi
run_cmd ':tabo'
[ -n "$vim_cmd" ] && run_cmd "$vim_cmd"

true
