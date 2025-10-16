sql folder has the versions of migrations
flyway folder has flyway job and database postgre deployment
next..
Create the ConfigMap with SQL migration files

kubectl create configmap flyway-sql \
  --from-file=flyway/sql/V1__create_table.sql \
  --from-file=flyway/sql/V2__insert_data.sql \
  -n db-migration-demo

we’ll focus on Flyway Job as a Helm hook:
the Job runs the migration scripts from your ConfigMap.
it should run before or after your app deploys (depends on your preference — usually before).

helm.sh/hook: pre-install,pre-upgrade → runs the Job before the chart is installed or upgraded.
hook-delete-policy: hook-succeeded → deletes the Job after successful execution.
hook-weight → controls the execution order if multiple hooks exist.

Step 3: Create Kubernetes Secret for DB credentials
kubectl create secret generic db-credentials \
  --from-literal=url=jdbc:postgresql://test-postgres:5432/demo \
  --from-literal=username=demo_user \
  --from-literal=password=demo_pass \
  -n db-migration-demo


  -------------------------------------------------------------------
  switched to init container
  
  -> update existing configmap
  kubectl create configmap flyway-sql \
  --from-file=flyway/sql/ \
  -n db-migration-demo \
  -o yaml --dry-run=client | kubectl apply -f -
-> apply the postgres.yaml "deployment"
kubectl apply -f flyway/chart/templates/postgres.yaml -n db-migration-demo
