{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/samogon/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
2112e117ed91a707bea6b5ec72f75b0dcb05ace87efd55549a67670f650dc51f
{% endblock %}

{% block go_bins %}
samogon
{% endblock %}

{% block go_tags %}
nosqlite
{% endblock %}
