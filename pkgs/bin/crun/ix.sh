{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.7.2/crun-1.7.2.tar.xz
sha:dfce0fdf042c7de84e8672369f54f723c2f788d2bde076a4c6edf530e6306b5a
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
bld/fakegit
{% endblock %}

{% block configure_flags %}
--disable-systemd
{% endblock %}
