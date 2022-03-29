{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/openal
{% endblock %}

{% block export_libs %}
${lib_openal}/lib/libopenal.a
{% endblock %}

{% block export_lib %}
openal
{% endblock %}
