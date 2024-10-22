{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v3.10.0.tar.gz
{% endblock %}

{% block go_sha %}
e6694c477f424f44e87f29c4c3b13ef5afcb90af698bb25c4135a5e9f287b413
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
