#!/bin/bash

# import data to arangodb instance

FILES="${1}"

pushd $FILES > /dev/null

  for file in *.json
  do
    collection_name=$(echo ${file%.*} | sed 's/.*/\u&/')
    collection_type=$(echo ${file##*.})
    
    arangoimport  --server.endpoint "tcp://arangodb:8529" \
                  --server.database $ARANGO_DB \
                  --server.username $ARANGO_USER \
                  --server.password "" \
                  --file ${file} \
                  --type ${collection_type} \
                  --on-duplicate "update" \
                  --overwrite "true" \
                  --collection "${collection_name}" \
                  --create-database true \
                  --create-collection true \
                  --batch-size 33554432 || exit 1
  done
popd > /dev/null


