{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/samogon/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
8897e611d621de751c99f4d1681cfc3d871eb85bf6caa9dbd424e63f91daa4d5
{% endblock %}

{% block go_bins %}
samogon
{% endblock %}

{% block go_tags %}
nosqlite
{% endblock %}
