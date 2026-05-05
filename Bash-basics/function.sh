!#/bin/bash

# 
#!/bin/bash

step() {
  echo "Args in function: $#"
  echo "First arg: $1"
  echo "Second arg: $2"
}

echo "Script args: $#"
step "$@"  # Passes all script args to function
sleep 2
step "$@"


