{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula
{% endblock %}

{% block version %}
1.9.6
{% endblock %}

{% block go_url %}
https://github.com/slackhq/nebula/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a4b7bd63e6c3c183b2e0c4f77794f9c02d813536c065050f9fb4c7cfc189f1bc
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
