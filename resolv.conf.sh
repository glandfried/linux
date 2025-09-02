#!/bin/bash
#sudo systemctl restart systemd-resolved
sed -i.bak \
    -e 's/^nameserver 127\.0\.0\.53$/nameserver 8.8.8.8/' \
    -e 's/^options edns0 trust-ad$/#options edns0 trust-ad/' \
    "/etc/resolv.conf"

# sed -i.bak \
#     -e 's/nameserver 127.0.0.53/nameserver 8.8.8.8/g' \
#     -e 's/options edns0 trust-ad/#options edns0 trust-ad/g' \
#     "$RESOLV_CONF"
