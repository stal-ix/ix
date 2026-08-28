{% extends '//die/go/build.sh' %}

{% block pkg_name %}
bluetuith
{% endblock %}

{% block version %}
0.2.7
{% endblock %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
501e82f23cab6f6298ad2bee30586b9f19a5514b686996b65604a7bc0ebe0e78
{% endblock %}

{% block go_bins %}
bluetuith
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
