{% extends '//die/c/make.sh' %}

{% block pkg_name %}
redis
{% endblock %}

{% block version %}
8.2.3
{% endblock %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/{{self.version().strip()}}.tar.gz
42d4d3f037db92eea4437ba03f87627cd636ed15a1f2dde7af9650aa94b035d8
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

{% block c_flags %}
-Wno-strict-prototypes
{% endblock %}
