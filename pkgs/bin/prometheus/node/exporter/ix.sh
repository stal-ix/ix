{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v1.7.0.tar.gz
{% endblock %}

{% block go_sha %}
d19990eb9d4775fe4ac3c150de744d9229e6eb780a64beba8d0b532602899388
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp node_exporter ${out}/bin/
{% endblock %}
