# backup-mongo
Create .env file with required variables

You can find root or pmadmin password in key vaults or running below command
kubectl get secret mongodb-raw-storage -o jsonpath="{.data.mongodb-root-password}" | base64 --decode 

Create secret:

kubectl create secret generic backup-mongo  --from-env-file .env --dry-run=client -o yaml > secret.yaml 
use below command to apply .yaml file
kubectl apply -f secret-backup-restore-mongo.yaml 

Check iush secret into your container registry

If it required, create Persistent Volumes Claims

Example files are added
mongo-dump-azure-pvc.yaml

Run a cronjob (backup or restore). By default, cronjobs are suspend and set to run a job at 01:00 on Sunday. You can rename a job name. Eg: backup-mongo-displayvideo

kubectl apply -f backup-mongo-cronjob.yaml
kubectl apply -f restore-mongo-cronjob.yaml
