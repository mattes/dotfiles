# brew install fswatch
function onchange { 
  fswatch -0 --event Updated . | xargs -0 -n1 -I{} $@
  sleep 1
}
