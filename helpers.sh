function validate(){ echo validate: ${1};  curl -F out=gnu -F "content=<${1}" http://vnu:8888/; [ -n "${2}" ] && { shift; validate $*; } }
