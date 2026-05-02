{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/13.tar.gz
{% endblock %}

{% block go_sha %}
6e4a17539fa1bf1f8c83603c53c31cdee110644246ffbdc2a9f5229a4a86a9a4
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
