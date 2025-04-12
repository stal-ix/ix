{% extends '//die/go/build.sh' %}

{% block pkg_name %}
yggdrasil-go
{% endblock %}

{% block version %}
0.5.9
{% endblock %}

{% block go_url %}
https://github.com/yggdrasil-network/yggdrasil-go/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
af4f0c6760551b54b21ca64bf43b4bada743d3fc34cd374c3fb84c36b92a7e27
{% endblock %}
