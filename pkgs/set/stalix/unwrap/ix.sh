{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/irq/balance/ix/runit

{% if not server %}
bin/sud
bin/iwd/runit
bin/seatd/runit
bin/sndio/runit
bin/acpi/d/runit
{% endif %}

set/stalix/dev/{{dev_mngr or 'fs'}}

bin/ix
bin/ix/init
bin/dbus/runit
bin/dhcpcd/runit
bin/openresolv/runit

bin/chrony/runit

{% if unbound %}
set/stalix/dns(dns_mngr=unbound)
{% elif dnsmasq %}
set/stalix/dns(dns_mngr=dnsmasq)
{% else %}
set/stalix/dns(dns_mngr={{dns_mngr or 'dnsproxy'}})
{% endif %}

{% if vt %}
bin/dm(getty=vt)
{% elif mingetty %}
bin/dm(getty=mingetty)
{% elif emptty %}
bin/dm(getty=emptty)
{% else %}
bin/dm(getty={{getty or 'vt'}})
{% endif %}

bin/sched/dmesg(delay=100)
bin/sched/fstrim(delay=1000)
bin/sched/builddir(delay=1000)
bin/sched/trashdir(delay=100)

bin/sched/stale/pids(delay=10)
bin/sched/stale/homes(delay=100)
bin/sched/stale/srvdirs(delay=100)
bin/sched/stale/cgroups(delay=1000)

etc

bin/kbd/vt
bin/ip/utils(intl_ver=stub)
bin/bsdutils/env

bin/sysklogd/runit
#bin/sysklogd/runit/deps/conf
#bin/busybox/syslogd

bin/busybox
{% endblock %}

{% block run_data %}
aux/tzdata
aux/ca/bundle
{% endblock %}
