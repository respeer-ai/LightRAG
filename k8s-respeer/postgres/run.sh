kubectl exec -it postgres-0 -n kube-system -- psql  -U postgres -c "CREATE EXTENSION vector;"
