echo "Building Share Note..."

docker build -t sharenote .

echo "Build completed!"

echo "Running Application..."

docker run -p 8080:8080 sharenote
