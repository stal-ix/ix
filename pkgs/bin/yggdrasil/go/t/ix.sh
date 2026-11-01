{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yggdrasil-go
{% endblock %}

{% block version %}
0.5.15
{% endblock %}

{% block go_url %}
https://github.com/yggdrasil-network/yggdrasil-go/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e837dd6215e6f04e8264fb636b605c356f78e8440d348714b8757ab6c6012f03
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
