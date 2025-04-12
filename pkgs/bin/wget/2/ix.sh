{% extends '//die/c/autohell.sh' %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-{{self.version().strip()}}.tar.gz
sha:2b3b9c85b7fb26d33ca5f41f1f8daca71838d869a19b406063aa5c655294d357
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/zstd
lib/intl
lib/pcre
lib/idn/2
lib/iconv
lib/bzip/2
lib/brotli
lib/gnutls
lib/ng/http/2
lib/shim/extra
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block configure_flags %}
--without-plugin-support
--with-ssl=gnutls
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/wget2_noinstall
{% endblock %}

{% block c_rename_symbol %}
log_init
{% endblock %}
