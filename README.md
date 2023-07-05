# Dgraph bulkload

> It is mandatory to use "cook-a-bulk.sh". Cuz it will download the latest dataset.

## Docker Compose

To use Docker Compose simply you need to execute `up.sh`.

```bash
> ./up.sh
```

## Todo

- [x] Basic bulk operations.

- [ ] Add multiple instances with 1 group.

- [ ] Add multiple instances with multiple groups.

## A Docker-compose with .sh

Well, the script is simple and will do everything for you if you copy this repo completely. It will check if the Bulk has already been performed and then decide whether to run the Alpha or not. Shortly after the Bulk it runs the Alpha automatically.

There is not much secret in this script. If you need to copy feel free to create a flow for your project.

Attention! Before using modify the vars using

````
> bash ./cook-a-bulk.sh
````

With /cook-a-bulk.sh you'll be able to modify the docker-compose and the vars in one shot! xD
Just run and accept or decline the questions.

````
my_alpha=alpha:7080 #if you use "localhost:7080" or 192.168.99.100:7080
my_zero=zero:5080 #if you use "localhost:5080" or 192.168.99.100:5080
my_alpha_memory=2048
dgraphVersion=v20.03.2
````

OBS: This PJ was made on MacOS (Darwin), to work on other systems few things need to be modified. For example, Docker-compose may work differently on Windows as the volume paths.

## commands "copy paste"

Under this repo you have to use docker compose

```docker-compose up -d```

or

```docker-compose up```
To see Logs

After the Bulk go to Ratel:

```192.168.99.100:8000```

or (If you setup a port forward 8000 to localhost or you're using a native docker)

```localhost:8000```

# Query for

Right after the bulkload and then the Alpha is UP. Query in Ratel for this:

````
{
  caro(func: allofterms(name@en, "Marc Caro")) {
    name@en
    director.film {
      name@en
    }
  }
  jeunet(func: allofterms(name@en, "Jean-Pierre Jeunet")) {
    name@en
    director.film {
      name@en
    }
  }
}
````

Should appears 10 nodes and 10 edges.

# Others tips

if you need to download the RDF and use in some kind of test out (with this repo, don't need tho)

```` wget "https://github.com/dgraph-io/tutorial/blob/master/resources/1million.rdf.gz?raw=true" -O 1million.rdf.gz -q ````

if you need to use vim create those files before

````touch docker-compose.yml && touch release.schema````

in ".schema" just paste your schema or the 1million example.

### Cleanup Docker

````
docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

docker volume ls

docker volume rm dgraphbulkscript_dgraph
# or
docker volume rm ${name_of_yourCOmpose}
````

## Anything about Dgraph go to

<https://docs.dgraph.io/>

## Te get in touch to our community go to

<https://discuss.dgraph.io/>

> # PS. the docker-compose is set to use Dgraph v20.03.2
