{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/32.tar.gz
{% endblock %}

{% block go_sha %}
144fe2ecc8c8d4746c07043510b6d32e7c6dd68b0b88b0fbbc1ff4b85d3d2a95
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
