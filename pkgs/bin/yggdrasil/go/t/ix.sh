{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yggdrasil-go
{% endblock %}

{% block version %}
0.5.12
{% endblock %}

{% block go_url %}
https://github.com/yggdrasil-network/yggdrasil-go/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c59bcdd803cc3380bca50fb5c6a50e3980955416ed425c36851259dcc731ea20
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
