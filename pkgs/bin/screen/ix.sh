{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
screen
{% endblock %}

{% block version %}
5.0.0
{% endblock %}

{% block fetch %}
#http://ftp.gnu.org/gnu/screen/screen-4.9.1.tar.gz
#sha:26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69
http://ftp.gnu.org/gnu/screen/screen-{{self.version().strip()}}.tar.gz
sha:f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971
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
