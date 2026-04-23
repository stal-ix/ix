{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/samogon/archive/refs/tags/5.tar.gz
{% endblock %}

{% block go_sha %}
aeafc3a87e15e470d9c2b202eff534cfd2d69cde48a338efa4cbd635a66920e5
{% endblock %}

{% block go_bins %}
samogon
{% endblock %}

{% block go_tags %}
nosqlite
{% endblock %}
