{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sh
{% endblock %}

{% block version %}
3.11.0
{% endblock %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ab69666c7d75caabdc5a0512cb9a2bdec8d08805d2321a62a40627d240c6c248
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
