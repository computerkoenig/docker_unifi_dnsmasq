# unifi_dnsmasq
A little DNS Server which askes the Ubiquiti UniFI API for static and dynamic client leases.


# Configuration

* Get docker-compose.example.yml
* Set the relevant values for these environment variables:

| Name                    | Description                                     | Default value        |
|-------------------------|-------------------------------------------------|----------------------|
| `UNIFI_BASEURL`         | URL to UniFi controller                         | `https://unifi:8443` |
| `UNIFI_USERNAME`        | Username to UniFi controller                    | -                    |
| `UNIFI_PASSWORD`        | Password to UniFi controller                    | -                    |
| `UNIFI_POLL_INTERVAL`   | Seconds between API calls to UniFi Controller   | `60`                 |
| `UNIFI_SITE`            | UniFi "site" name                               | `default`            |
| `FIXED_ONLY`            | Flag for only handling clients with reserved IP | `False`              |

* `docker-compose up`
* UniFi clients with DNS-compatible aliases will be written to `/etc/dnsmasq.d/unifi.hosts` for dnsmasq.
