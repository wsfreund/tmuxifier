# Create new window. If no argument is given, window name will be based on
# layout file name.
[ -z "$name" ] && name="htop"
new_window "$name"
run_cmd "MANUAL_TITLE=$name"
# Run commands.
run_cmd "htop"
true
