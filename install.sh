SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true
REPLACE="
"

print_modname() {
  ui_print "*******************************"
  ui_print "            MyLogcat           "
  ui_print "*******************************"
}

on_install() {
  ui_print "Setting logcat script..."
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}
