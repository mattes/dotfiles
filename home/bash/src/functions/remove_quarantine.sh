function remove_quarantine {
  xattr -d com.apple.quarantine "$1"
}