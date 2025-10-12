{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula
{% endblock %}

{% block version %}
1.9.7
{% endblock %}

{% block go_url %}
https://github.com/slackhq/nebula/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4eb9fed4c34ecb9328aba7e269e86a60d09739046d4c2a6cf436de9205148ea7
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
