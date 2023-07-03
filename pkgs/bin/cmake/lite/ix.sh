{% extends '//bin/cmake/t/ix.sh' %}

{% block bld_libs %}
lib/uv/44
lib/curl/lite
lib/archive/lite
{{super()}}
{% endblock %}
