{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v2.55.0.tar.gz
{% endblock %}

{% block go_sha %}
1cd3f74a8a245f2de6c204ff8577b3a34877d39606d1eb08569ac9ecbce11735
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
