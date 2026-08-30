{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
m4
{% endblock %}

{% block version %}
1.4.21
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-{{self.version().strip()}}.tar.xz
f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block std_box %}
{{super()}}
bld/help2man
{% endblock %}

{% block configure_flags %}
--disable-c++
{% endblock %}
