FROM centos:centos7

ENV PUBLIC_KEY_FILE=/tmp/public_key.pem
ENV TF_VAR_private_key_file=/tmp/private_key.pem
ENV TF_VAR_terraform_s3=flowi-terraform

RUN useradd -ms /bin/bash usr_terraform
WORKDIR /home/usr_terraform

RUN yum update -y && \
    yum install openssl unzip -y && \
    yum clean all

RUN curl -O -L https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip && \
    unzip ./terraform_0.12.26_linux_amd64.zip -d /usr/local/bin/ && \
    rm terraform_0.12.26_linux_amd64.zip

RUN curl -O -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.23.2/terragrunt_linux_amd64 && \
    chmod +x terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    rm -rf aws/

COPY . .

RUN chown usr_terraform:usr_terraform -R /home/usr_terraform && \
    chmod +x *.sh

USER usr_terraform