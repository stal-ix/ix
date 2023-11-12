{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/uv
lib/curl
lib/curses
lib/archive
{{super()}}
{% endblock %}

{% block setup %}
{{super()}}
export CXXFLAGS="-Wno-elaborated-enum-base ${CXXFLAGS}"
{% endblock %}
