{% extends '//lib/qt/6/multimedia/t/ix.sh' %}

{% block lib_deps %}
lib/gstreamer
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
FEATURE_gstreamer=ON
{% endblock %}
