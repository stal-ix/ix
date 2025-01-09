{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.4.2.tar.gz
sha:199ebc73ff858ae3ac122ebea7e483d5da0c1ee2f1de73b6404d4780036e9474
{% endblock %}

{% block bld_libs %}
lib/c
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
