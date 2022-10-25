{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.1.tar.gz
sha:e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee8555c0cf276d646d45
{% endblock %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_libs %}
lib/c
lib/xml/2
lib/iconv
lib/unistring
lib/textstyle
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/byacc
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-tools
{% endblock %}

{% block configure_flags %}
--with-installed-libtextstyle
{% endblock %}
