{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.5/crun-1.5.tar.xz
sha:8e7e1636adb3cc12d45cdf4ddfd0503604950d0d2868a0bfa9666b90d0a8d9d7
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
