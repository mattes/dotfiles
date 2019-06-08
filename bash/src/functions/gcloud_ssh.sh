function gcloud_ssh {
  if [[ ! -e "$HOME/.ssh/google_compute_engine_projects" ]]; then
    echo "Missing ~/.ssh/google_compute_engine_projects file"
    exit 1
  fi

  if [[ ! -e "$HOME/.ssh/google_compute_engine" ]]; then
    echo "Missing ~/.ssh/google_compute_engine cert"
    exit 1
  fi

  if [[ ! -e "$HOME/.ssh/google_compute_engine.pub" ]]; then
    echo "Missing ~/.ssh/google_compute_engine.pub"
    exit 1
  fi

  while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ "$line" != "" ]]; then
      cmd="gcloud compute config-ssh --project $line"
      echo $cmd
      $cmd
    fi
  done < "$HOME/.ssh/google_compute_engine_projects"
}

