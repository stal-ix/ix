{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
90625ff8762ddcb9231255250f90df08053616dcb36dc69f9d55ddbd7d43a1a5
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
