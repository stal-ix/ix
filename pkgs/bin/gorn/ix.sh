{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/18.tar.gz
{% endblock %}

{% block go_sha %}
e9507b3935c4de58ec6d22939c34f600a0af391b1b33a1ec0e4d1cb5e0b2728a
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
