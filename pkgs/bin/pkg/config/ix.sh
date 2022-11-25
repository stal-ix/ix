{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
sha:6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/glib
{% endblock %}

{% block configure_flags %}
--disable-host-tool
{% endblock %}

{% block env %}
export PKG_CONFIG="${out}/bin/pkg-config"
export PKG_PROG_PKG_CONFIG="${out}/share/aclocal/pkg.m4"
{% endblock %}

{% block test %}
. ${out}/env
cat ${PKG_PROG_PKG_CONFIG}
{% endblock %}
