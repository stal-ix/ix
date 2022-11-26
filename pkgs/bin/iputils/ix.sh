{% extends '//die/c/meson.sh' %}

{# seems broken #}

{% block fetch %}
https://github.com/iputils/iputils/archive/refs/tags/20221126.tar.gz
sha:745ea711fe06d5c57d470d21acce3c3ab866eb6afb69379a16c6d60b89bd4311
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/idn/2
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/fakexslt
{% endblock %}

{% block meson_flags %}
SKIP_TESTS=true
{% endblock %}
