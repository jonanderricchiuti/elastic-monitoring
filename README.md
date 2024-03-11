docker compose --file docker-compose-certs.yml up
docker compose build
docker compose  up -d enode1 enode2 enode3
docker compose exec enode1 bash
bin/elasticsearch-reset-password --url https://enode1:9200 --username elastic
bin/elasticsearch-reset-password --url https://enode1:9200 --username kibana_system
bin/elasticsearch-reset-password --url https://enode1:9200 --username beats_system
docker compose up -d kibana
go to http://localhost:5601/app/dev_tools#/console
GET _cat/nodes?v
