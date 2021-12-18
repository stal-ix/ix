{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/brotli/mix.sh
lib/zstd/mix.sh
lib/nghttp2/mix.sh
lib/xz/mix.sh
lib/z/mix.sh
lib/intl/mix.sh
lib/iconv/mix.sh
lib/gnutls/mix.sh
lib/bzip2/mix.sh
lib/idn/2/mix.sh
lib/pcre/mix.sh
{% endblock %}

{% block bld_tool %}
dev/doc/texinfo/mix.sh
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
