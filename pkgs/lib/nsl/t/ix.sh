{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnsl
{% endblock %}

{% block version %}
2.0.1
{% endblock %}

{% block fetch %}
https://github.com/thkukuk/libnsl/releases/download/v{{self.version().strip()}}/libnsl-{{self.version().strip()}}.tar.xz
sha:5c9e470b232a7acd3433491ac5221b4832f0c71318618dc6aa04dd05ffcd8fd9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
