{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/8.tar.gz
{% endblock %}

{% block go_sha %}
8cb4ba945830b2be2b42af8d3cfd3efa83f3d078f30843b4db7bc46e7e010c1c
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
