{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fetchmail
{% endblock %}

{% block version %}
6.5.6
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_{{self.version().strip()[:3]}}/fetchmail-{{self.version().strip()}}.tar.xz
ec10e0e0eaa417313559379ede76c74614766d838b39470b66474863aa690dab
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
