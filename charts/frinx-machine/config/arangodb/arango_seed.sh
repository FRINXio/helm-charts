#!/bin/bash

# import data to arangodb instance

set -x

FILES="${1}"

pushd $FILES > /dev/null

  for file in *.json
  do
    collection_name=$(echo ${file%.*} | cut -d '_' -f 1 | sed 's/.*/\u&/')
    collection_type=$(echo ${file%.*} | cut -d '_' -f 2)
    file_type=$(echo ${file##*.})
    
    echo $collection_name $collection_type $file_type

    arangoimport  --server.endpoint "tcp://arangodb:8529" \
                  --server.database $ARANGO_DB \
                  --server.username $ARANGO_USER \
                  --server.password "" \
                  --file ${file} \
                  --type ${file_type} \
                  --create-collection-type	${collection_type,,} \
                  --on-duplicate "update" \
                  --overwrite "true" \
                  --collection "${collection_name}" \
                  --create-database true \
                  --create-collection true \
                  --batch-size 33554432 || exit 1
  done
popd > /dev/null