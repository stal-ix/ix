{% extends '//die/go/build.sh' %}

{% block pkg_name %}
croc
{% endblock %}

{% block version %}
11.6.2
{% endblock %}

{% block go_url %}
https://github.com/schollz/croc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e43b080df9b63c1175bbd8fde326af0a7d7e71aa5374d5f862c24fa3465a1c0a
{% endblock %}

{% block go_bins %}
croc
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
