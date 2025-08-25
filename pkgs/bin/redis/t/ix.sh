{% extends '//die/c/make.sh' %}

{% block pkg_name %}
redis
{% endblock %}

{% block version %}
8.2.1
{% endblock %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/{{self.version().strip()}}.tar.gz
517e47ebce911ebbed2fe86047a871d9cbeadc7d2de15ffca37a1540eb4d588f
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block make_flags %}
MALLOC=libc
USE_SYSTEMD=no
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-strict-prototypes ${CFLAGS}"
{% endblock %}
