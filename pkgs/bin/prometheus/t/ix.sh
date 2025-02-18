{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v3.2.0.tar.gz
{% endblock %}

{% block go_sha %}
92b9b14ba98d4fe3e6feb6168086c1099817942876f8f2a5461420cb2f8ec0ae
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
