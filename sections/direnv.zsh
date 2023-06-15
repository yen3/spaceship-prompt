#
# direnv
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DIRENV_SHOW="${SPACESHIP_DIRENV_SHOW=true}"
SPACESHIP_DIRENV_ASYNC="${SPACESHIP_DIRENV_ASYNC=true}"
SPACESHIP_DIRENV_PREFIX="${SPACESHIP_DIRENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DIRENV_SUFFIX="${SPACESHIP_DIRENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DIRENV_SYMBOL="${SPACESHIP_DIRENV_SYMBOL=""}"
SPACESHIP_DIRENV_COLOR="${SPACESHIP_DIRENV_COLOR="gray"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Haskell Tool Stack.
spaceship_direnv() {
  [[ $SPACESHIP_DIRENV_SHOW == false ]] && return

  local is_direnv_dir=$(spaceship::upsearch .envrc)
  [[ -n "$is_direnv_dir" ]] || return

  if spaceship::exists direnv; then
    spaceship::section \
      --color "$SPACESHIP_DIRENV_COLOR" \
      --prefix "$SPACESHIP_DIRENV_PREFIX" \
      --suffix "$SPACESHIP_DIRENV_SUFFIX" \
      --symbol "$SPACESHIP_DIRENV_SYMBOL" \
      "direnv"
  else
    return
  fi
}
