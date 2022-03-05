# curso-alura-terraform
Curso de Terraform: Automatize a infraestrutura na nuvem

## Iniciando
```bash
# inicia o localstack e o terraform
docker-compose up -d

# acessa o container com terraform
docker-compose exec terraform sh
```

## Instalação do terraform localmente
Após realizar o download do binário execute:
```bash
# descompacta o binário
unzip terraform_1.1.6_linux_amd64.zip

# adiciona permissão de execução e move para /usr/local/bin/
chmod +x terraform ; sudo mv terraform /usr/local/bin/

# verifica versão do terraform
terraform -version
```

## Anotações
```bash
# gera chave ssh com criptografia rsa
ssh-keygen -f terraform-aws -t rsa

# adiciona configuração aws para o profile localstack
aws configure --profile localstack

# prepara o diretório de traballho
terraform init

# reformata o arquivo .tf
terraform fmt

# osra as mudanças necessárias 
terraform plan

# cria ou atualia a infraestrutura
terraform apply

# destrói a infraestrutura criada
terraform destroy

# mostra a configuração atual
terraform show

# verifica o bucket criado no localstack
aws s3api list-buckets --query "Buckets[].Name" \
--endpoint-url=http://localhost:4566

# lista as tags das instâncias ec2 
aws --endpoint-url=http://localhost:4566 ec2 describe-instances \
--query "Reservations[].Instances[].Tags[].Value"

# lista as instâncias ec2
aws --endpoint-url=http://localhost:4566 ec2 describe-instances \
--query 'Reservations[*].Instances[*].{Instance:InstanceId,Tag:Tags[*]}'

# lista os security groups
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups

# adiciona bucket foobar
touch /tmp/foobar
aws --endpoint-url=http://localhost:4566 s3 mb s3://foobar

# copia arquivo para o bucket
# onde adrianoavelino-dev4 é o nome do bucket
aws --endpoint-url=http://localhost:4566 s3 cp /tmp/foobar s3://adrianoavelino-dev4

# lista os arquivos do bucket adrianoavelino-dev4
aws --endpoint-url=http://localhost:4566 s3 ls s3://adrianoavelino-dev4

# delete um arquivo do bucket adrianoavelino-dev4
aws --endpoint-url=http://localhost:4566 s3 ls s3://adrianoavelino-dev4
```

## Links
- [Providers](https://registry.terraform.io/browse/providers)
- [Security Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [S3 bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
