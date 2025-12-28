{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fetchmail
{% endblock %}

{% block version %}
6.6.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_{{self.version().strip()[:3]}}/fetchmail-{{self.version().strip()}}.tar.xz
a5109295ec3319e0e45edd009d2d977042a8326ab52c6a817a82fa987103e4f3
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/gettext
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}
