{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.6.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7100d2df948e5ee1919d996b2c8667b2e0b5998257232ee98d60cbd6d7c19cb8
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
