### helm generate file
```
helm template stg-core ./ -f ./helm-values/core/stg-uhre/uhre/value.yaml --output-dir gen-core-stg-uhre

helm template qat-core ./ -f ./helm-values/core/qat-uhre/uhre/value.yaml --output-dir gen-core-qat-uhre

helm template prd-core ./ -f ./helm-values/core/prd-uhre/uhre/value.yaml --output-dir gen-core-prd-uhre
```
