function create_token {
  openssl rand -hex 3 | tr -d '\n' | pbcopy
}