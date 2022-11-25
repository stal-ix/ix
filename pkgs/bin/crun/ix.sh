{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.7.1/crun-1.7.1.tar.xz
sha:bceade123d27ce31ab31bca14351e0cf4951e57b5b45de7a2dd3d512ef17912f
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
