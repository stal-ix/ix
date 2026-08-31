{% extends '//die/c/make.sh' %}

{% block pkg_name %}
redis
{% endblock %}

{% block version %}
8.10.1
{% endblock %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/{{self.version().strip()}}.tar.gz
b0f0cf1927b6ff8d5a523eb7f97c5bcaafbfbef96ffa23f643494bd4af527eee
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

{% block patch %}
# Redis only consumes xxHash's static archive.
sed -i 's/$(MAKE) lib CFLAGS=/$(MAKE) libxxhash.a CFLAGS=/' ../deps/Makefile
# The default target builds test modules that are not installed.
sed -i 's/ $(TLS_MODULE) module_tests/ $(TLS_MODULE)/' Makefile
{% endblock %}

{% block make_flags %}
MALLOC=libc
USE_SYSTEMD=no
{% endblock %}

{% block c_flags %}
-Wno-strict-prototypes
{% endblock %}
