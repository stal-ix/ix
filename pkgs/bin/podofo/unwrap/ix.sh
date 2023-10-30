{% extends '//lib/podofo/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/lua
{% endblock %}

{% block cmake_flags %}
{{super()}}
PODOFO_BUILD_TOOLS=ON
{% endblock %}
