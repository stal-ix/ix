{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/17.tar.gz
{% endblock %}

{% block go_sha %}
b1eae473f9be55a0950f73fbd3140d12c7e1d91003a6d39ee416757f30dfe79f
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
