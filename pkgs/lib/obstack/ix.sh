{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
musl-obstack
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block fetch %}
https://github.com/void-linux/musl-obstack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:9ffb3479b15df0170eba4480e51723c3961dbe0b461ec289744622db03a69395
{% endblock %}

{% block patch %}
rm bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
