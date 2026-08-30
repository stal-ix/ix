{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
moe
{% endblock %}

{% block version %}
1.16
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/moe/moe-{{self.version().strip()}}.tar.lz
4c25cd78919272aebec0a7f8c126011bb5a4b5d87422807a3423216f0a17a868
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curses
{% endblock %}
