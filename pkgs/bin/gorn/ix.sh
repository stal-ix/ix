{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/20.tar.gz
{% endblock %}

{% block go_sha %}
5b3e7a77752b95822e834c85802b2c6f3ec4ed98d07c8ae6a2f5bb60696bd7f4
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
