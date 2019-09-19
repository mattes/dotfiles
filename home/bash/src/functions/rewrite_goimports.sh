function rewrite_goimports {
  find . -not -path .git -type f -print0 | xargs -0 sed -i "s;$1;$2;g"
}
