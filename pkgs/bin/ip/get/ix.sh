{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ipget
{% endblock %}

{% block version %}
0.12.0
{% endblock %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0e76ea924072f0b39e3e9f7f195bb0a9990cbcb3b3b31bb92537fb7495939c12
{% endblock %}

{% block go_bins %}
ipget
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
