function git_dirty() {
  # If we're not in a git repo, return
  ! git rev-parse --git-dir &> /dev/null && return 0

  # Get indicator if uncommited changes
  local dirty
  [[ -n $(git status --porcelain) ]] && dirty="*"

  echo ${GIT_DIRTY_PREFIX}${dirty:gs/%/%%}${GIT_DIRTY_SUFFIX}
}

function git_prompt() {
  # If we're not in a git repo, return
  ! git rev-parse --git-dir &> /dev/null && return 0

  # Get the first of:
  # - the current branch name
  # - the tag name if we are on a tag
  # - the short SHA of the current commit
  local ref
  ref=$(git symbolic-ref --short HEAD 2> /dev/null) || \
  ref=$(git describe --tags --exact-match HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || \
  return 0

  echo "${GIT_PROMPT_PREFIX}${ref:gs/%/%%}$(git_dirty)${GIT_PROMPT_SUFFIX}"
}

function venv_prompt() {
  # If we're not in a virtualenv, return
  [[ -z ${VIRTUAL_ENV} ]] && return 0

  echo "${VENV_PROMPT_PREFIX}${VIRTUAL_ENV:t:gs/%/%%}${VENV_PROMPT_SUFFIX}"
}

local new_line=$'\n'
local reset_color="%{[00m%}"
local red="%{[38;5;009m%}"
local blue="%{[38;5;032m%}"
local green="%{[38;5;078m%}"
local yellow="%{[38;5;214m%}"
local purple="%{[38;5;093m%}"
local cyan="%{[38;5;075m%}"
local gray="%{[38;5;237m%}"

GIT_PROMPT_PREFIX="${blue}(${green}"
GIT_PROMPT_SUFFIX="${blue})${reset_color} "
GIT_DIRTY_PREFIX="${yellow}"
GIT_DIRTY_SUFFIX="${reset_color}"
VENV_PROMPT_PREFIX="${cyan}["
VENV_PROMPT_SUFFIX="]${reset_color} "

setopt prompt_subst
function set_prompt() {
    PROMPT="${new_line}${blue}%~ $(git_prompt)${purple}» ${reset_color}"
    RPROMPT="%(?..${red}%? ↵ )$(venv_prompt)${gray}%n@%m${reset_color}"
}

precmd_functions+=(set_prompt)
