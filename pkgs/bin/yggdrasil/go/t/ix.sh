{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yggdrasil-go
{% endblock %}

{% block version %}
0.5.14
{% endblock %}

{% block go_url %}
https://github.com/yggdrasil-network/yggdrasil-go/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d3d0172d428e49056b4fc6ead7b44f1e8b7ab3bfa52adcdc577cf937cacd3389
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
