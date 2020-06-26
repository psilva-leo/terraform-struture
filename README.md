# Terraform structure

This project aims to manage AWS resources.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Terraform 0.12.26
Terragrunt 0.23.2
Docker

### Installing

Terraform runs on docker. The following command works on Power Shell. See "Encryption Variables" for CMD and linux bash commands difference.

```
docker run --rm -it -v ${PWD}:/home/usr_terraform -e ENVIRONMENT=develop -e AWS_ACCESS_KEY_ID=$Env:AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$Env:AWS_SECRET_ACCESS_KEY terraform bash
```

## Creating pem Files

Pem files can created at https://8gwifi.org/RSAFunctionality?keysize=1024

Save the Public key content to public_key.pem and the Private key content to private_key.pem and store it on S3 at terraform-structure-<environment>/ as private_key.pem and public_key.pem

## Encryption Variables

To encrypt a phrase depends on the command line inteface.

### Power Shell
```
docker run --rm -e ENVIRONMENT=develop -e AWS_ACCESS_KEY_ID=$Env:AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$Env:AWS_SECRET_ACCESS_KEY terraform ./encrypt.sh <value_to_encrypt>
```

### CMD
```
docker run --rm -e ENVIRONMENT=develop -e AWS_ACCESS_KEY_ID=%AWS_ACCESS_KEY_ID% -e AWS_SECRET_ACCESS_KEY=%AWS_SECRET_ACCESS_KEY% terraform ./encrypt.sh <value_to_encrypt>
```

### Linux Bash
```
docker run --rm -e ENVIRONMENT=develop -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY terraform ./encrypt.sh <value_to_encrypt>
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Terraform](terraform.io/) - Infrastructure as Code
* [Tetrragrunt](https://terragrunt.gruntwork.io/) - Extra tools for keeping your configurations DRY


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
