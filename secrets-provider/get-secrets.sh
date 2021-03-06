#!/bin/sh
echo Accessing secrets manager for $1
aws secretsmanager --region ca-central-1 get-secret-value --secret-id qglobal/$1/postgres/secrets | jq -r .SecretString > secrets/postgres.properties
aws secretsmanager --region ca-central-1 get-secret-value --secret-id qglobal/$1/redshift/secrets | jq -r .SecretString > secrets/redshift.properties

echo Accessing s3 for key file for $1
aws s3 cp s3://qglobal/identity-service/$1 ./identity --recursive

echo done