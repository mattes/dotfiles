function open_ports {
  lsof -i -P | grep -i "listen"
}