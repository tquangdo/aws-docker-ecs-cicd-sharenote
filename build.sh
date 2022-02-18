echo "Building Share Note..."

docker build -t sharenote ./ECS

echo "Build completed!"

echo "Running Application..."

docker run -p 8082:8080 sharenote
