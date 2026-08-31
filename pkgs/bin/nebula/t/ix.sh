{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula
{% endblock %}

{% block version %}
1.11.1
{% endblock %}

{% block go_url %}
https://github.com/slackhq/nebula/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
39d3b98cb232cbb4356c41235032b0fa7e5e038ccab9bba4e1f92b29401a5a48
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
