{% extends '//die/go/build.sh' %}

{% block pkg_name %}
age
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block go_url %}
https://github.com/FiloSottile/age/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9eb2714b4c7ac59539a5ef0d62e9cf48a8a3d05b5cd3cd68a304ff216b397f51
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
