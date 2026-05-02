{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/19.tar.gz
{% endblock %}

{% block go_sha %}
1490c01c78fa899e720df0ffa1e7fb02c0ed6566c1d58e016fc9df38374cf8ec
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
