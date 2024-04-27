Like was stated previously, the project is composed by 5 nodes, 2 DNS nodes in a master-slave configuration, 2 caching nodes and 1 server nodes.

DNS nodes run BIND DNS server software and contain the GeoIP information for all the countries in an ACL , which allows us to route requests to our pretended caching nodes.

Caching nodes run varnish sofware, and periodically poll the server to check for updated content.

Server node runs NGINX and hosts a simple site just to serve as an example.
Site is generated using a SSG (static site generator) using a tool called "hugo" 