Escolhi a cloud AWS, pois eu já tinha a conta

Adicionei um usuário em IAM na AWS com "políticas existentes", com AmazonEC2FullAccess, access key ID e secret access key

Configurei o profile com essas credenciais com aws cli, para executar o terraform

Criei uma key pair para acessar a vm via ssh, para conferir as instalações de docker e da app

Escrevi os códigos do terraform para provisionar a infra com vpc, sg e ec2

Liberei a porta 22 no security group via terraform e a porta 8000 da app

Eu poderia ter criado um s3 na aws para armazenar o state, mas nesse caso não vi necessidade

Escrevi o script "install-docker.sh" para ser executado após o provisionamento da ec2 pelo terraform, para instalação e configuração do docker, mas não está surtindo efeito os comandos de permissão do usuário para execução dos comandos docker, então executei novamente de forma manual dentro da vm:
```bash
# Add user to the docker group
sudo usermod -aG docker $USER
newgrp docker
```

Subi o repositório da aplicação para o meu github [ https://github.com/nayaralopes/desafio-devops ]

Configurei um yml para o github actions e um dockerfile para o build da app em imagem docker e deploy na vm

Tentei fazer o build da imagem docker durante a execução da pipeline, mas não estava encontrando o dockerfile, então deixei para fazer o build da imagem, fazer o push para o docker hub e fazer o pull dentro da vm da app

Configurei a vm como runner do github actions, fazendo as instalações e configurações de forma manual dentro da vm após o provisionamento seguindo os passos informado no github em "settings >> actions >> runner >> new self-hosted runner"

Usei a própria vm da app como runner do github actions, o que não é ideal

O IP da vm onde será feito o deploy da app, será exibido no output do terraform, usado para execução dos comandos curl

Sobre monitoramento, eu gostaria de ter instalado e configurado o prometheus e grafana com playbook do ansible, mas não consegui aproveitar o tempo e fazer a tempo

De curiosidade, adicionei o recurso do cloudwatch com terraform para monitorar o consumo de cpu da vm da app