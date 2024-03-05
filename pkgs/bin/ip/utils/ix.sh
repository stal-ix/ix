{% extends '//die/c/meson.sh' %}

{# seems broken #}

{% block fetch %}
https://github.com/iputils/iputils/archive/refs/tags/20240117.tar.gz
sha:a5d66e2997945b2541b8f780a7f5a5ec895d53a517ae1dc4f3ab762573edea9a
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/idn/2
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block meson_flags %}
SKIP_TESTS=true
{% endblock %}
