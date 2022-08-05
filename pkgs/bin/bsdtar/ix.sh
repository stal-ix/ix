{% extends '//lib/archive/ix.sh' %}

{% block bld_libs %}
lib/md
lib/intl
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_MD=ON
ENABLE_LIBMD=ON
{% endblock %}
