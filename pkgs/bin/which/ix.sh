{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
which
{% endblock %}

{% block version %}
2.25
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/which/which-{{self.version().strip()}}.tar.gz
1cb83e4f702e60b8211ab5ec4c2afbab1b1dec80209456a7d2faf7584ed225ea
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}
