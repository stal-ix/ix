{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/10.tar.gz
{% endblock %}

{% block go_sha %}
680a29f5131c98af6183fa896eaed04863f84d2293a0a14faa0ea4155ffa7c17
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
