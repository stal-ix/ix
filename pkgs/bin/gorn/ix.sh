{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
b09cf872d24df45eca26855d3abb21abf9dcf54798846192d9c803dcbc727615
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
