{% extends '//bin/libtool/t/ix.sh' %}

{% block lib_deps %}
lib/c
{{super()}}
{% endblock %}
