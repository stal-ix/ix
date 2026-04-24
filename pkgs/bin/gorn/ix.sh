{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/22.tar.gz
{% endblock %}

{% block go_sha %}
bfaac8c307245f75b00ad233fb719892cf2a3c4c29fb670f142bd3a4c663a60c
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
