ls_colors() {
  local TEXT="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  for code in {000..255}; do
    print -P -- "${code}: %{[38;5;${code}m%}${TEXT}%{[00m%}"
  done
}

ls_backgrounds() {
  local TEXT="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  for code in {000..255}; do
    print -P -- "${code}: %{[48;5;${code}m%}${TEXT}%{[00m%}"
  done
}

jsoncurl() {
    curl -i -s $* -H "Content-Type:" -H "Content-Type: application/json" | awk -v RS='\r\n\r\n' -v ORS='\n\n' 'NR==1; NR>1 {print $0 | "jaq --color always ." }'
}
