{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/logovo/archive/refs/tags/7.tar.gz
{% endblock %}

{% block go_sha %}
9474cad25d9a6daa5524da531e0b4eba63aaf2f3f1025d8e56f90ae025cedaa4
{% endblock %}

{% block go_bins %}
logovo
{% endblock %}
