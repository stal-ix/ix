{% extends '//bin/cmake/t/mix.sh' %}

{% block bld_libs %}
lib/curl/lite
lib/archive/lite
{{super()}}
{% endblock %}
