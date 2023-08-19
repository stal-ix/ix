{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/screen/screen-4.9.1.tar.gz
sha:26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/pam
{% endif %}
lib/curses
{% endblock %}

{% block setup %}
{# no select - no screen! #}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block configure_flags %}
--enable-pam
--disable-socket-dir
--enable-colors256
{% endblock %}
