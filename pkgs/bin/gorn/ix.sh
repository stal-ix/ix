{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/19.tar.gz
{% endblock %}

{% block go_sha %}
8b6b4bee8d3a2ae874f66fc10361b6ca1726b25111bd6c79ece43f94a8415887
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
