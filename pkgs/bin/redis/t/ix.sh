{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.2.0.tar.gz
sha:b594b6eae1a69fd1c081ebfcc9bd9bc9843ba120a2b3960c45f3eeee1f34e0e6
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

{% block setup %}
export CFLAGS="-Wno-strict-prototypes ${CFLAGS}"
{% endblock %}
