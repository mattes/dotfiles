function docker_container_ip4 {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
}

function docker_exec {
  docker exec -it $1 bash
}

function docker_container_ips {
  docker inspect --format='{{.NetworkSettings.IPAddress}}  {{printf "%.12v" .Id}}  {{.Name}}  {{.Config.Image}}' $(docker ps -q)
}