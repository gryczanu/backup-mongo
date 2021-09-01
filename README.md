# backup-mongo
1. Create .env file with required variable

2. Create secret:

kubectl create secret generic backup-mongo  --from-env-file .env --dry-run=client -o yaml > secret.yaml 
use below command to apply .yaml file
kubectl apply -f secret-backup-restore-mongo.yaml 

3. If it required, create Persistent Volumes Claims

Example files are added

pvc.yaml

4. Run a cronjob (backup or restore). By default, cronjobs are suspend and set to run a job at 01:00 on Sunday. You can rename a job name. Eg: backup-mongo-displayvideo

kubectl apply -f backup-mongo-cronjob.yaml
kubectl apply -f restore-mongo-cronjob.yaml
