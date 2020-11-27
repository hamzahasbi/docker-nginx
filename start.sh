if [ "$1" = "build" ]
then
  docker-compose up --force-recreate --build -d
elif [ "$1" = "run" ]
then
  docker-compose up -d
else
    echo "Missing env mode."
    exit 0
fi
docker-compose exec php /bin/bash
