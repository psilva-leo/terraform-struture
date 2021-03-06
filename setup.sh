#!/bin/bash


download_file(){
    if ! test -f "$2"; then
        echo s3://$TF_VAR_terraform_s3-$ENVIRONMENT/$1 $2
        aws s3 cp s3://$TF_VAR_terraform_s3-$ENVIRONMENT/$1 $2
    fi
}

download_file private_key.pem $TF_VAR_private_key_file
download_file public_key.pem $PUBLIC_KEY_FILE
