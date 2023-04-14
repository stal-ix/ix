{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.8.4/crun-1.8.4.tar.xz
sha:0d2475d1dbcfed224f21e740782c7a7c45c53444eb7b84a493764e2a0ee36166
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/yajl
lib/seccomp
lib/argp/standalone
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/python
bld/fakegit
{% endblock %}

{% block configure_flags %}
--disable-dl
--disable-systemd
--disable-embedded-yajl
{% endblock %}
