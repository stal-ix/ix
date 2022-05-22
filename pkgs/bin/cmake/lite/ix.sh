{% extends '//bin/cmake/t/ix.sh' %}

{% block bld_libs %}
lib/curl/lite
lib/archive/lite
{{super()}}
{% endblock %}
