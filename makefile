IMAGE_NAME=cicd-python-demo
CONTAINER_NAME=cicd-python-demo-container
PORT=8000

run:
	docker build -t $(IMAGE_NAME) .
	docker run --name $(CONTAINER_NAME) -p $(PORT):8000 $(IMAGE_NAME)

remove:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
	docker rmi $(IMAGE_NAME) || true