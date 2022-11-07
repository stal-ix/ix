{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.7/crun-1.7.tar.xz
sha:4de7fccf38a127f2b9d3a5c5d1f7f974ae150918dac6d68adf089ece3cbd485f
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
bld/python
bld/scripts/fakegit
{% endblock %}

{% block configure_flags %}
--disable-systemd
{% endblock %}
