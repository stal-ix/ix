{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/wirez/archive/refs/tags/6.tar.gz
{% endblock %}

{% block go_sha %}
fbd47dc7d8041b090fee430b719fbab649feb0e08f8e6e7b68dfe175c5ac1b02
{% endblock %}

{% block go_bins %}
wirez
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
