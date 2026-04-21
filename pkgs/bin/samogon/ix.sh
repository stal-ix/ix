{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/samogon/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
81832dcfc14699b7820f9618d9e45df2a652dbbf4bdbf3b248fef197c3200dcd
{% endblock %}

{% block go_bins %}
samogon
{% endblock %}

{% block go_tags %}
nosqlite
{% endblock %}
