{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block bld_libs %}
lib/c
lib/brotli
lib/zstd
lib/nghttp2
lib/xz
lib/z
lib/intl
lib/iconv
lib/gnutls
lib/bzip2
lib/idn/2
lib/pcre
{% endblock %}

{% block bld_tool %}
bin/texinfo
{% endblock %}

{% block configure_flags %}
--without-plugin-support
--with-ssl=gnutls
{% endblock %}

{% block patch %}
cat lib/xalloc-die.c      \
    | grep -v 'memory ex' \
    > _ && mv _ lib/xalloc-die.c
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/wget2_noinstall
{% endblock %}
