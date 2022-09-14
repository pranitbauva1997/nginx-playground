# Nginx Playground

## Architecture of the experiment

There are two app containers which have a FastAPI server running and an nginx container to load balance the requests.

## Notes

1. The very initial version which could properly load balance was keeping around 400-500 TCP connections open but
   but luckily the open TCP connections inside the container running uvicorn were very low.
2. The second version with additional configs around TCP connection resuse and keep-alives could manage to keep
   the open TCP connections at both the containers (nginx, uvicorn) in under 10.
