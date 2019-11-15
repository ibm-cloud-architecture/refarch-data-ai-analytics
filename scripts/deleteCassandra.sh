nspace=greencompute
grace=$(kubectl get po cassandra-0 -o=jsonpath='{.spec.terminationGracePeriodSeconds}')
kubectl delete statefulset -l app=cassandra -n $nspace
echo "Sleeping $grace"
sleep $grace
kubectl delete pvc,pv,svc -l app=cassandra -n $nspace 
