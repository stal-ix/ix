{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcgroup
{% endblock %}

{% block version %}
2.0.3
{% endblock %}

{% block fetch %}
https://github.com/libcgroup/libcgroup/releases/download/v{{self.version().strip()}}/libcgroup-{{self.version().strip()}}.tar.gz
b29b5704de3d0fadf199fe4e17eeeaecba7f0dd1b85569c96eec37c7672e3026
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/fts
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block configure_flags %}
--enable-pam=no
--enable-tools=no
--enable-daemon=no
{% endblock %}
