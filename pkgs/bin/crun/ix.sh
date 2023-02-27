{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.8.1/crun-1.8.1.tar.xz
sha:01b68269d94e5fe11106a9b14c2f144be03b16ec798951f4efa6aa16ba9da29a
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
