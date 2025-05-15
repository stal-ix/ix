{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
screen
{% endblock %}

{% block version %}
5.0.1
{% endblock %}

{% block fetch %}
#http://ftp.gnu.org/gnu/screen/screen-4.9.1.tar.gz
#sha:26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69
http://ftp.gnu.org/gnu/screen/screen-{{self.version().strip()}}.tar.gz
sha:bca9b5b9022ca7b8c1a61b503e53ace7dd7cb61eac14e39e7ccbc0b139495d49
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

{% block setup_target_flags %}
{# no select - no screen! #}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block configure_flags %}
--enable-pam
--enable-colors256
{% endblock %}
