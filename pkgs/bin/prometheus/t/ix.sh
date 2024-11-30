{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v3.0.1.tar.gz
{% endblock %}

{% block go_sha %}
8ba4235173f46e52102576c5ce6ae8422aa2446e23c34f0e7282ead5f5a97418
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
