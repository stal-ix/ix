{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/zstd
lib/intl
lib/pcre
lib/bzip2
lib/idn/2
lib/iconv
lib/brotli
lib/gnutls
lib/nghttp2
{% endblock %}

{% block bld_tool %}
bin/texinfo
{% endblock %}

{% block configure_flags %}
--without-plugin-support
--with-ssl=gnutls
{% endblock %}

{% block patch %}
sed -e 's|.*memory ex.*||' -i lib/xalloc-die.c
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/wget2_noinstall
{% endblock %}
