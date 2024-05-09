{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/slackhq/nebula/archive/refs/tags/v1.9.0.tar.gz
{% endblock %}

{% block go_sha %}
6f48e0e4edb38e329ba727ea89a39457de603509a3de31b00b26349154e4ffcc
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
