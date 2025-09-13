{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
screen
{% endblock %}

{% block version %}
5.0.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/screen/screen-{{self.version().strip()}}.tar.gz
2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d
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
