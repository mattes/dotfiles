function tmp {
  num=1
  while [[ -e "/tmp/t$num" ]]; do
    let num++
  done
  mkdir -p "/tmp/t$num" && cd $_
}