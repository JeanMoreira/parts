# Sitema parte
Sistema tem como objetivo vender peças de carros com melhor qualidade e maior velocidade. 
#### install docker 
>> [Docker install](https://www.docker.com/community-edition)
#### Build your containers
```
docker-compose build
```
#### Install all dependences
```
docker-compose run --rm website bundle install
```
#### Create database
```
docker-compose run --rm website bundle exec rake db:create
```
#### Create tables
```
docker-compose run --rm website bundle exec rake db:migrate
```
#### Run
```
docker-compose up
```
#### Recriar db
```
docker-compose run --rm website bundle exec rake db:drop db:create db:migrate
```
#### Gerar erd do banco 
```
docker-compose run --rm website bundle exec erd
```
#### Task setup sistema part
 * Gera o banco novamente e executas todas as task numeradas abaixo.
```
docker-compose run --rm website bundle exec rake dev:setup
```
* Gera cadastros aleatorios de carros no sistema.
```
docker-compose run --rm website bundle exec rake dev:generate_cars
```
* Gera cadastros aleatorios de categorias no sistema.
```
docker-compose run --rm website bundle exec rake dev:generate_categories
```
* Gera cadastros aleatorios de peças no sistema.
```
docker-compose run --rm website bundle exec rake dev:generate_parts
```
* Gera o administrador
```
docker-compose run --rm website bundle exec rake dev:generate_adm
```
* Gera cadastros aleatorios de empresas no sistema.
```
docker-compose run --rm website bundle exec rake dev:generate_company
```
* Gera cadastros aleatorios de membros no sistema.
```
docker-compose run --rm website bundle exec rake dev:generate_members
```
* Gera cadastros vincula os dados da empresa com as peças.
```
docker-compose run --rm website bundle exec rake dev:generate_companyParts
```
* Gera cadastros aleatorios de anúncios no sistema.
```
docker-compose run --rm website bundle exec rake dev:generate_ads
```
