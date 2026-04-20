{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/9.tar.gz
{% endblock %}

{% block go_sha %}
0afd6250e703b486cf7b693f4e8c4e42d3200890ec68aa33217d0cf0d5e07c66
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
