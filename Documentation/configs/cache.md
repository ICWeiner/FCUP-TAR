Add this line to varnish.service

```
/usr/sbin/varnishd -j unix,user=vcache -F -a :80 -T localhost:6082 -f /etc/varnish/user.vcl -S /etc/varnish/secret -s malloc,1G
```

And add the IP address or name of the server that you want to cache in etc/varnish/user.vcl , in the host field.

Varnish is very powerful, and you can do a lot of configuration in /etc/varnish/user.vcl , but for this use case, where the website to be cached is static, the defaults are plenty good enough.