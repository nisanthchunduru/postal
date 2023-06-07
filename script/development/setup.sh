# Create signing key
openssl genrsa -out config/signing.key 1024
chmod 644 config/signing.key

# Start containers
docker-compose --project-name postal -f docker-compose.development.yml up --build --detach

# Initialize Postal
docker-compose --project-name postal -f docker-compose.development.yml exec postal bundle exec /opt/postal/bin/postal initialize

# Stop containers
docker-compose --project-name postal -f docker-compose.development.yml stop
