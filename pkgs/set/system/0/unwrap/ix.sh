{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdevd/runit
bin/ix
bin/sud
bin/iwd/runit
bin/runit/sys
bin/dbus/runit
bin/openresolv
bin/acpid/runit
bin/seatd/runit
bin/sndio/runit
bin/dhcpcd/runit
bin/ananicy/runit
# https://wiki.musl-libc.org/functional-differences-from-glibc.html#Name-Resolver/DNS
{% if dnsmasq %}
bin/dnsmasq/runit
{% else %}
bin/unbound/runit
{% endif %}

{% if mingetty %}
bin/mingetty/runit
{% else %}
bin/emptty/runit
{% endif %}

bin/sched/builddir(delay=1000)
bin/sched/trashdir(delay=100)
bin/sched/staleprocs(delay=10)

etc
bin/busybox
bin/busybox/syslogd
bin/busybox/ntpd(delay=100)
{% endblock %}

{% block run_data %}
aux/tzdata
{% endblock %}
