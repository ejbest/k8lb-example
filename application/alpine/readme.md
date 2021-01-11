#
#nginx pod scaling 

#to Scale based on cpu 50%
#kubectl autoscale deployment alpine-deployment --cpu-percent=50 --min=1 --max=10

#scale up to n number replicas
#kubectl scale deployment.apps/alpine --replicas=6 