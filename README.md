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

