{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/curl
{% endblock %}

{% block export_libs %}
${lib_curl}/lib/libcurl.a
{% endblock %}

{% block export_lib %}
curl
{% endblock %}
