{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bzip3
{% endblock %}

{% block version %}
1.5.5
{% endblock %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/{{self.version().strip()}}.tar.gz
d61c05785bccb50d4af75107556d9fc7373995f873270b729184509e9f1be6dd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
