{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/wirez/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
98225f4ef25efd71f95d93ec7ef9d3b7b9c01270fa5c9ef1d7acee697dad45da
{% endblock %}

{% block go_bins %}
wirez
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
