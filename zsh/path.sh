# Add directories to the PATH and prevent to add the same directory multiple times upon shell reload.
add_to_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# Homebrew
add_to_path "/opt/homebrew/bin"
add_to_path "/opt/homebrew/sbin"

# Custom binaries
add_to_path "$HOME/.git-coauthor"
add_to_path "/Library/TeX/texbin"