{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/5.tar.gz
{% endblock %}

{% block go_sha %}
d33f779507a8d0ad9bb3e4a5e95c009467be5736a260fe4187d67459b9b769de
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
