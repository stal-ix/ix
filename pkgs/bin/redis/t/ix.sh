{% extends '//die/c/make.sh' %}

{% block pkg_name %}
redis
{% endblock %}

{% block version %}
8.2.0
{% endblock %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/{{self.version().strip()}}.tar.gz
c64219bdcba407d18c8dde1fb87b86945aebf75e60f5b44ff463785a962645ed
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
