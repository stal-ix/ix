{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsproxy
{% endblock %}

{% block version %}
0.76.1
{% endblock %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e0a49dd19678e57af0cde9ece5dde06bec40216fc14170bd13764c3ebc844b84
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
dnsproxy
{% endblock %}
