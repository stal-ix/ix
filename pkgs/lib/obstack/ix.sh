{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.2.2
{% endblock %}

{% block fetch %}
https://github.com/void-linux/musl-obstack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
md5:edee8cb45ca351de5759b85f2aca0f3b
{% endblock %}

{% block patch %}
rm bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
