# Automate Let's Encrypt SSL/TLS Certificate Deployment to NameSilo

### docker-compose.yml
```yaml
version: '3'
services:
  app:
    container_name: namesilo_letsencrypt_app
    image: elquimista/namesilo-letsencrypt:latest
    stdin_open: true
    tty: true
    restart: unless-stopped
    volumes:
      - ./config.py:/app/config.py
      - ./letsencrypt:/etc/letsencrypt
```

### Start
```sh
docker-compose up -d
```

### Generate certificates for the first time
```sh
docker-compose exec app ./namesilo-certbot.sh --email me@blue.planet -d "example.com"
```
This command will generate certificate key files under `letsencrypt` folder (specified in the docker compose volume section). The script will take 60 minutes to finish execution (due to Namesilo's DNS propagation taking approximately 60 minutes at the time of writing this. Feel free to adjust the waiting minutes appropriately in `config.py`).

### Using certificates
Now you have certificate files generated inside `letsencrypt` folder, you can use them by mounting them to another Docker container that runs Nginx or symlink them if you run Nginx directly on the host OS. It's up to you.

### Renewal of certificates
Certificates are renewed automatically with certbot renew command and cronjob. It's baked into this Docker image so you don't have to do anything.

---

Credit to [ethauvin/namesilo-letsencrypt](https://github.com/ethauvin/namesilo-letsencrypt) for the under the hood heavylifting.
