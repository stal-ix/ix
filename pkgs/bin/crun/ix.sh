{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.8/crun-1.8.tar.xz
sha:6dc621b6825eaf0d6a8f70d2a7fa9adde24cee3ad9221a5efbadb0b8b25e0843
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
