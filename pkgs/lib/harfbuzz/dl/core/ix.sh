{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/harfbuzz
{% endblock %}

{% block export_libs %}
libharfbuzz.a
{% endblock %}

{% block export_lib %}
harfbuzz
{% endblock %}
