#!/usr/bin/env sh

export BASHTHINGS_FUNCTIONS=$BASHTHINGS_FOLDER/functions
export BASHTHINGS_SCRIPTS=$BASHTHINGS_FOLDER/scripts
export BASHTHINGS_MODULES=$BASHTHINGS_FOLDER/modules
JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
[ -n "$JAVA_HOME" ] && export JAVA_HOME

# Select the right console editor
if [ "$(command -v vim)" ]; then
    EDITOR_CONSOLE=vim
elif [ "$(command -v nano)" ]; then
    EDITOR_CONSOLE=nano
fi
# Select the right GUI editor
if [ "$(command -v code-insiders)" ]; then
    EDITOR_GUI=code-insiders
elif [ "$(command -v code)" ]; then
    EDITOR_GUI=code
fi

[ -n "$EDITOR_GUI" ] && EDITOR=$EDITOR_GUI || EDITOR=$EDITOR_CONSOLE
export EDITOR && export EDITOR_CONSOLE && export EDITOR_GUI

# Add bash things path
export PATH="$PATH":"$BASHTHINGS_SCRIPTS"/bin

# shellcheck disable=SC2155
[ "$(command -v vivid)" ] && export LS_COLORS="$(vivid generate jellybeans)"
