{% extends '//lib/jpeg/turbo/ix.sh' %}

{% block fetch %}
https://github.com/mozilla/mozjpeg/archive/refs/tags/v4.1.5.tar.gz
sha:9fcbb7171f6ac383f5b391175d6fb3acde5e64c4c4727274eade84ed0998fcc1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{{super()}}
PNG_SUPPORTED=OFF
{% endblock %}

{% block bld_tool %}
{{super()}}
{% if darwin %}
bld/cctools
{% endif %}
{% endblock %}
