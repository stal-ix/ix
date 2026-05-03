{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/22.tar.gz
{% endblock %}

{% block go_sha %}
f6a260aca8c2d451d79804f24e605ed896f5ca2457ed44fa7f88a33fe8da39d5
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
