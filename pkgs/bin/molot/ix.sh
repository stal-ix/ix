{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/12.tar.gz
{% endblock %}

{% block go_sha %}
ac42770d3b07db9969c3f46ec9d619030616cc5edd9cc543ebf619217cd34824
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
