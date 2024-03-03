{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/prometheus/prometheus/releases/download/v2.50.1/prometheus-web-ui-2.50.1.tar.gz
sha:da37c3d0dfe9d09a9bf986bf5e7834f57b6d3b384c1ea53b71f7448f40714c47
{% endblock %}

{% block unpack %}
mkdir ${out}/share
cd ${out}/share
extract 0 ${src}/prom*
{% endblock %}

{% block env %}
export PROMETHEUS_UI="${out}/share"
{% endblock %}
