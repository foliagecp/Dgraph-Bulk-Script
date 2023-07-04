#! /usr/bin/env bash

# URL_1M="https://github.com/dgraph-io/benchmarks/blob/master/data/1million.rdf.gz?raw=true"
URL_21M="https://github.com/dgraph-io/benchmarks/blob/master/data/release/21million.rdf.gz?raw=true"
URL_schema="https://github.com/dgraph-io/benchmarks/blob/master/data/release/release.schema?raw=true"

curlData() {
    curl --progress-bar -LS -o $1 "$2"
}

if [ ! -f ./service/release.schema ]; then
    echo "release.schema File does not exist"
    curlData "./$@/release.schema" $URL_schema
else
    echo "release.schema exists"
fi

if [ ! -f ./service/21million.rdf.gz ]; then
    echo "21million File does not exist"
    curlData "./$@/21million.rdf.gz" $URL_21M
else
    echo "21million.rdf.gz exists"
fi
