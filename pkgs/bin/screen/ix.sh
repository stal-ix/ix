{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
screen
{% endblock %}

{% block version %}
5.0.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/screen/screen-{{self.version().strip()}}.tar.gz
ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/pam
lib/bsd/overlay
{% endif %}
lib/curses
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block c_flags %}
{# no select - no screen! #}
-Wno-implicit-function-declaration
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block configure_flags %}
--enable-pam
--enable-colors256
{% endblock %}
