{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libmd
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libmd-{{self.version().strip()}}.tar.xz
fc0f1eb6b6766470326f2c014693809190e67dba84274a6fbae9d4912d066706
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
