if [ "$#" -lt 1 ]; then
  echo "You must provide a sample!"
else
  if [ -e "./bin/parser" ]; then
    ./bin/parser "$1"
  else
    echo "You must build the project first! Run 'make build'"
  fi
fi
