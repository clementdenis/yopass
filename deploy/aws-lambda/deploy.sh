#!/bin/bash
set -ex 

echo 'building yopass'
GOOS=linux GOARCH=arm64 go build -ldflags -s -tags lambda.norpc -mod=readonly -o bin/function/bootstrap
zip -j bin/function.zip bin/function/bootstrap
npx serverless deploy

echo 'Yopass backend deployed!'
echo "Set the backend url when building the website."
echo "REACT_APP_BACKEND_URL=https://yourlambda.execute-api.eu-west-1.amazonaws.com/dev/ yarn build"