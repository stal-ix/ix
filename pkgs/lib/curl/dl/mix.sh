{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/curl
{% endblock %}

{% block export_libs %}
libcurl.a
{% endblock %}

{% block export_lib %}
curl
{% endblock %}
