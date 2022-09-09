{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.6/crun-1.6.tar.xz
sha:8ae387950f3f75aaff7fe9da14f2f012be842a8b20038bb8344a451197b40ee4
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
