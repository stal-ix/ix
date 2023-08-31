{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-2.1.0.tar.gz
sha:a05dc5191c6bad9313fd6db2777a78f5527ba4774f665d5d69f5a7461b49e2e7
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
