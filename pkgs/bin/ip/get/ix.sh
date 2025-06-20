{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ipget
{% endblock %}

{% block version %}
0.11.2
{% endblock %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e6d13a1006949bf5785d9b3860a5dbb01fb2b3093ca56fc51f224f464eb6f1b2
{% endblock %}

{% block go_bins %}
ipget
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
