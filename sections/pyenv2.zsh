#
# pyenv
#
# An advanced, purely functional programming language.
# Link: https://www.haskell.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PYENV2_SHOW="${SPACESHIP_PYENV2_SHOW=true}"
SPACESHIP_PYENV2_ASYNC="${SPACESHIP_PYENV2_ASYNC=true}"
SPACESHIP_PYENV2_PREFIX="${SPACESHIP_PYENV2_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PYENV2_SUFFIX="${SPACESHIP_PYENV2_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PYENV2_SYMBOL="${SPACESHIP_PYENV2_SYMBOL="λ "}"
SPACESHIP_PYENV2_COLOR="${SPACESHIP_PYENV2_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Haskell Tool Stack.
spaceship_pyenv2() {
  [[ $SPACESHIP_PYENV2_SHOW == false ]] && return

  local is_pyenv_version=$(spaceship::upsearch .python-version)
  [[ -n "$is_pyenv_version" ]] || return

  if spaceship::exists pyenv; then
    local pyenv_version=$(pyenv version | head -n1 | awk '{ print $1 }')
    spaceship::section \
      --color "$SPACESHIP_PYENV2_COLOR" \
      --prefix "$SPACESHIP_PYENV2_PREFIX" \
      --suffix "$SPACESHIP_PYENV2_SUFFIX" \
      --symbol "$SPACESHIP_PYENV2_SYMBOL" \
      "$pyenv_version"
  else
    return
  fi
}
