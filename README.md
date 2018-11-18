# Consumidor


## Armazenamento
![Tráfego](https://github.com/ecellani/consumidor/blob/master/images/armazenamento.png?raw=true)

### Base A
Amazon RDS for PostgreSQL é uma base altamente confiável e segura, suporta alta escalabilidade. É tudo o que preciso para atender as necessidades dos sistemas que acessarão a "Base A".

### Base B
O MongoDB é um banco de dados orientado a documentos, de fácil manutenção e tem alta performance. Atende as necessidades dos jobs, que farão extração de dados, com os documentos no formato de JSON, os jobs não terão dificuldades para manipular as informações.

### Base C
Sem dúvidas, elasticsearch é a base de dados que precisamos para indexar os dados e entregar as informações com muita agilidade e segurança.

## Tráfego
![Tráfego](https://github.com/ecellani/consumidor/blob/master/images/trafego.png?raw=true)

***Todas as requisições devem ser autenticadas utilizando o padrão JWT***

### Primeiro sistema
O primeiro sistema, precisa de informações da Base A, que possui os dados mais sensíveis. Este sistma jamais poderá fazer acesso diretamente a base de dados por questão de segurança. O fluxo deve ser o seguinte:

1. Envia as requisições para uma fila (SQS)

2. Haverá um consumidor (em instâncias auto escaláveis EC2 ou containers) ouvindo a fila, e ao chegar uma nova requisição, fará a consulta dos dados

  * A entrega do resultado, se ultrapassar o tamanho limite da fila, então o resultado será armazenado em um S3 Bucket, e o link será enviado para a fila de resposta
  
  * Se não ultrapassar o tamanho limite da fila, então o resultado será entregue diretamente na fila
  
3. O solicitante deve consumir os dados da fila para obter o resultado

### Segundo sistema
O segundo sistema acessará um endpoint para consumir os dados através de instâncias auto escaláveis (EC2 ou containers).

[Segundo Sistema](https://github.com/ecellani/consumidor/tree/master/score)

* [Testes](https://github.com/ecellani/consumidor/tree/master/score/src/test/java/br/com/score/application)

### Terceiro sistema
O terceiro sistema tem a mais alta performance, pois trata-se de uma função lambda simples, com poucas regras de negócio, que fará buscas em um banco de dados de altíssima performance.

[Terceiro Sistema](https://github.com/ecellani/consumidor/tree/master/lambda-scripts/search_events)

* [Testes](https://github.com/ecellani/consumidor/tree/master/lambda-scripts/tests)


## Infraestrutura
![Tráfego](https://github.com/ecellani/consumidor/blob/master/images/diagram_1-challenge-vpc.png?raw=true)
