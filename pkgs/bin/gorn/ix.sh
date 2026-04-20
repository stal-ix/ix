{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/8.tar.gz
{% endblock %}

{% block go_sha %}
a196c51e31c392e27b62993be1404b637728a7bee0581272e2ca663f298a616a
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
