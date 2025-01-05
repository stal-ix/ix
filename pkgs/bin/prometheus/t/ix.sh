{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v3.1.0.tar.gz
{% endblock %}

{% block go_sha %}
59781a7d7cb7c64e49c5d8daf6562df8b9b7e8988221e4405439f96836b9c8f9
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
