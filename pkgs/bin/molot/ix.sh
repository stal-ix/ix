{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
cc89ac6c3a73d2363d7e12144cb8f1b0bf256cdaad9a94f02c793cd670a0af8d
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
