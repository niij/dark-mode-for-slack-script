#!/bin/sh

slackResourceDir=/Applications/Slack.app/Contents/Resources
ssbInterop=$slackResourceDir/app.asar.unpacked/src/static/ssb-interop.js
darkModeToggle=$slackResourceDir/dark-mode-toggle.pref
darkModeAddon=$(dirname "$0")/dark-mode-addon.js

setup()
{
  if grep -q dark-mode-toggle\.pref $ssbInterop; then
    echo "Slack has already been patched."
  else
    cat $darkModeAddon >> $ssbInterop
    echo "Patch successfully applied."
  fi

  enable
}

enable()
{
  echo "enabled" > $darkModeToggle
  refresh
  exit
}

disable()
{
  echo "" > $darkModeToggle
  refresh
  exit
}

refresh()
{
  echo "Please refresh slack for changes to take effect with the hotkey Command+R"
}

help()
{
  echo "Command not found. Try setup, enable or disable"
  exit 1
}

case $1 in
  setup )  setup;;
  enable ) enable;;
  disable ) disable;;
  * ) help;;
esac
