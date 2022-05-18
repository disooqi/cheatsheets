docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 -v /local-data/:/data redis/redis-stack:latest
docker exec -it redis-stack redis-cli


cat data.txt | docker exec -i redis-stack redis-cli --pipe
