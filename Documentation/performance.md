E preciso correr estes testes, numa internet decente (ler: não na eduroam...)


# Origin server
wrk -t12 -c400 -d30s http://34.146.201.17

# Cache node europeia - bypass DNS
wrk -t12 -c400 -d30s http://34.34.162.115

# Cache node medio oriente - bypass DNS
wrk -t12 -c400 -d30s http://34.18.55.219

# Cache node mais proxima do cliente
wrk -t12 -c400 -d30s http://www.tar-cdn.cloud