{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ipget
{% endblock %}

{% block version %}
0.11.3
{% endblock %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
25f929db6d1ddaa6da00c952301fba0a906fb6d62829c893265c3262c30d7342
{% endblock %}

{% block go_bins %}
ipget
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
