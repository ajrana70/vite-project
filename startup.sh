#!/bin/bash
 
 echo "Generating .env with param dev-1 for service vite-project"
 
 aws ssm get-parameters-by-path --path "/dev-1/vite-project/" --with-decryption    --region  --query="Parameters[*].[Name, Value]"    --output text |
   while read line
   do
     name=$(echo ${line}} | cut -f 1 -d ' ' | sed -e "s//dev-1/vite-project///g")
     value=$(echo ${line} | cut -f 2 -d ' ')
     echo "${name}=${value}" >> .env
   done
 ls -lart
 python manage.py runserver 0.0.0.0:3000
 #node index.js