{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/samogon/archive/refs/tags/3.tar.gz
{% endblock %}

{% block go_sha %}
74b020909e10262b2066e3cb5293dc7414d5879b9b6163acd49cb2521f1f2699
{% endblock %}

{% block go_bins %}
samogon
{% endblock %}

{% block go_tags %}
nosqlite
{% endblock %}
