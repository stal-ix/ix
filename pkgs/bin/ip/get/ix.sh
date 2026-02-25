{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ipget
{% endblock %}

{% block version %}
0.12.2
{% endblock %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0bdbcc6f20e5ca99841f77c940753f9265a4d706eff74e237981dd38f371595c
{% endblock %}

{% block go_bins %}
ipget
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
