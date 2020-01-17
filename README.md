# OURS Docker and environment setup

## Basic requirements and depedencies
install in your local machine:
- docker
- docker-compose

## Setup boilerplate
<p>
  Create a folder structure such as below : 
  
workspace
    ├─ ours
        ├─ projects
        
</p>

## Clone required projects and docker setting
execute commands below :<br />
Linux base<br />
```
cd ~/workspace/ours/projects
git clone git@github.com:ver50n/ours.git
cd ~/workspace/ours
git clone git@github.com:ver50n/stacks.git
cd ~/workspace/ours/stacks
docker-compose up -d
docker exec -it php74 bash
cd /var/www/html/ours
cp .env.local .env
composer install
php artisan key:generate
php artisan migrate
php artisan db:seed
yarn watch
```

## Check your local apps
Open browser and visit https://localhost (proceed the security warning page)
