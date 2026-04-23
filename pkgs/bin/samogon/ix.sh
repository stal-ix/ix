{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/samogon/archive/refs/tags/6.tar.gz
{% endblock %}

{% block go_sha %}
ee050bb3e27da10dee8a7bafafc3f603091709e64c815e3b0b5ebecad1edb93e
{% endblock %}

{% block go_bins %}
samogon
{% endblock %}

{% block go_tags %}
nosqlite
{% endblock %}
