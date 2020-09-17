docker build -t jf00/multi-client:latest -t jf00/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jf00/multi-server:latest -t jf00/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jf00/multi-worker:latest -t jf00/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jf00/multi-client:latest
docker push jf00/multi-server:latest
docker push jf00/multi-worker:latest

docker push jf00/multi-client:$SHA
docker push jf00/multi-server:$SHA
docker push jf00/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jf00/multi-server:$SHA
kubectl set image deployments/client-deployment client=jf00/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jf00/multi-worker:$SHA
