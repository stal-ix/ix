{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/wirez/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
39db59729754e05a89dcb0dd4e915d60f09be22d546bf881bcaba0d01c6974a2
{% endblock %}

{% block go_bins %}
wirez
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
