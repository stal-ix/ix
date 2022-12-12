{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/7.0.6.tar.gz
sha:2853b0848c5e78429d28adb9ae2e2b3f03781a3e547a485df2926fa2e4093e95
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
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
{% endblock %}
