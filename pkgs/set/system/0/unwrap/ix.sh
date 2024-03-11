{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdevd/runit
bin/ix
bin/sud
bin/iwd/runit
bin/runit/sys
bin/dbus/runit
bin/seatd/runit
bin/sndio/runit
bin/dhcpcd/runit
bin/acpi/d/runit
bin/openresolv/runit

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

{% if mingetty %}
bin/dm(getty=mingetty)
{% elif emptty %}
bin/dm(getty=emptty)
{% else %}
bin/dm(getty=mingetty)
{% endif %}

bin/sched/fstrim(delay=1000)
bin/sched/builddir(delay=1000)
bin/sched/trashdir(delay=100)

bin/sched/stale/cgroups(delay=1000)
bin/sched/stale/procs(delay=10)
bin/sched/stale/homes(delay=10)
bin/sched/stale/srvdirs(delay=10)

etc

bin/session
bin/bsdutils/env
bin/busybox
bin/busybox/syslogd
bin/busybox/ntpd(delay=100)
{% endblock %}

{% block run_data %}
aux/tzdata
{% endblock %}
