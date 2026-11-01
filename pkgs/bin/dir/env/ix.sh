{% extends '//die/go/build.sh' %}

{% block pkg_name %}
direnv
{% endblock %}

{% block version %}
2.38.2
{% endblock %}

{% block go_url %}
https://github.com/direnv/direnv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6b6e06ad96c2f23047ac545292c06702b6bcd8e34f45ef83dcd718aad61ea2d8
{% endblock %}

{% block go_bins %}
direnv
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
