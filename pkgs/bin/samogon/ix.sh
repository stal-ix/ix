{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/samogon/archive/refs/tags/7.tar.gz
{% endblock %}

{% block go_sha %}
6c4cabe69f2a65639443d1f501abca2a71c8685caa62562a2b5425b3302583e2
{% endblock %}

{% block go_bins %}
samogon
{% endblock %}

{% block go_tags %}
nosqlite
{% endblock %}
