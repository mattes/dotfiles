if [[ -e /usr/local/opt/xtensa-esp32-elf/bin ]]; then
  export PATH=$PATH:/usr/local/opt/xtensa-esp32-elf/bin
fi

if [[ -e /usr/local/opt/esp-idf ]]; then
  export IDF_PATH=/usr/local/opt/esp-idf
fi
