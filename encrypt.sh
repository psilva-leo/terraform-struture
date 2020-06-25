#!/bin/bash

usage() {
  cat << EOF >&2
Usage: $0 <value_to_encrypt>
  <value_to_encrypt>: string to encrypt
EOF
  exit 1
}



if [ -z "$1" ]; then
    usage
fi

source /home/usr_terraform/setup.sh
echo $1 | echo $(openssl rsautl -encrypt -pubin -inkey $PUBLIC_KEY_FILE -out >(base64)) | tr -d " \t\n\r" 
echo ""
