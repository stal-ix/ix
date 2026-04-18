{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
c5c361db38edd531e1e9bc460f2e4c386fc27e1bb3f5cb6e946c48f3a05ee1f2
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
