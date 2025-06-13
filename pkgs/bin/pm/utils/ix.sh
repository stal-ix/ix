{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
pm-utils
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block fetch %}
https://pm-utils.freedesktop.org/releases/pm-utils-{{self.version().strip()}}.tar.gz
8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
