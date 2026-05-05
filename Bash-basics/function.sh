!#/bin/bash

# 
#!/bin/bash

myfunc() {
  echo "Args in function: $#"
  echo "First arg: $1"
}

echo "Script args: $#"
myfunc "$@"  # Passes all script args to function

