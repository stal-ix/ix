{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
2.50.1
{% endblock %}

{% block fetch %}
https://github.com/prometheus/prometheus/releases/download/v{{self.version().strip()}}/prometheus-web-ui-{{self.version().strip()}}.tar.gz
da37c3d0dfe9d09a9bf986bf5e7834f57b6d3b384c1ea53b71f7448f40714c47
{% endblock %}

{% block unpack %}
mkdir ${out}/share
cd ${out}/share
extract 0 ${src}/prom*
{% endblock %}

{% block env %}
export PROMETHEUS_UI="${out}/share"
{% endblock %}
