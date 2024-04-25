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

{% if mdevd %}
bin/mdevd/runit
{% elif devfs %}
bin/runit/devfs
{% elif mdev %}
bin/busybox/mdev
{% else %}
bin/mdevd/runit
{% endif %}

bin/ix
bin/runit/sys
bin/dbus/runit
bin/dhcpcd/runit
bin/openresolv/runit

bin/chrony/runit

# https://wiki.musl-libc.org/functional-differences-from-glibc.html#Name-Resolver/DNS
{% if unbound %}
bin/unbound/runit
{% else %}
#bin/avahi/runit
#bin/avahi/dns/runit
bin/mdns/runit
bin/mdns/dns/runit
bin/dnsmasq/runit
{% endif %}

{% if vt %}
bin/dm(getty=vt)
{% elif mingetty %}
bin/dm(getty=mingetty)
{% elif emptty %}
bin/dm(getty=emptty)
{% else %}
bin/dm(getty=vt)
{% endif %}

bin/sched/dmesg(delay=100)
bin/sched/fstrim(delay=1000)
bin/sched/builddir(delay=1000)
bin/sched/trashdir(delay=100)

bin/sched/stale/pids(delay=10)
bin/sched/stale/procs(delay=10)
bin/sched/stale/homes(delay=100)
bin/sched/stale/srvdirs(delay=100)
bin/sched/stale/cgroups(delay=1000)

etc

bin/session
bin/kbd/vt
bin/ip/utils(intl_ver=stub)
bin/bsdutils/env
bin/busybox
bin/busybox/syslogd
{% endblock %}

{% block run_data %}
aux/tzdata
{% endblock %}
