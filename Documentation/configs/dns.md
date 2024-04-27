Start off by going into https://geoip.site/ and downloading one of the ACLs and placing it in /etc/bind

Next add

```
include "/etc/bind/GeoIP.acl";
```

to your named.conf 

Afterwards add this to your named.conf.local

```
view "europe" {
        match-clients { PT; ES; FR; DE; BE; LU; IT; };
        zone "tar-cdn.cloud"{
                type master;
                file "/etc/bind/db.tar-cdn.cloud.EU";
                allow-transfer {35.195.170.91; };
        };
};

view "middleeast" {
        match-clients { BH; CY; EG; IR; IQ; LB; OM; QA; TR; };
        zone "tar-cdn.cloud"{
                type master;
                file "/etc/bind/db.tar-cdn.cloud.ME";
                allow-transfer {35.195.170.91; };
        };
};

view "row" {
        match-clients { any; };
        zone "tar-cdn.cloud"{
                type master;
                file "/etc/bind/db.tar-cdn.cloud.ROW";
                allow-transfer { 35.195.170.91; };
        };
};
```

and finally

create your zone file db.tar-cdn.cloud.EU

```
$TTL    604800
@       IN      SOA     ns1.tar-cdn.cloud. admin.tar-cdn.cloud. (
                     2024033001         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
; name servers - NS records
     IN      NS      ns1.tar-cdn.cloud.
     IN      NS      ns2.tar-cdn.cloud.

; name servers - A records
ns1.tar-cdn.cloud.          IN      A       104.199.36.206
ns2.tar-cdn.cloud.          IN      A       35.195.170.91

; - A records
www.tar-cdn.cloud.        IN      A      34.34.162.115
```

Repeat for all other regions replacing the last A record with the ip of the caching node for that particular region