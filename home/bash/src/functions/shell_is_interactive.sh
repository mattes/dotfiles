function shell_is_interactive {
  case $- in
  *i*)
    return 0
    ;;
  *)
    return 1
    ;;
  esac
}
