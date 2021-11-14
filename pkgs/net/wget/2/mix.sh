{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block bld_deps %}
lib/brotli/mix.sh
lib/zstd/mix.sh
lib/nghttp2/mix.sh
lib/xz/mix.sh
lib/z/mix.sh
lib/intl/mix.sh
lib/iconv/mix.sh
lib/gnutls/mix.sh
lib/bzip2/mix.sh
lib/idn2/mix.sh
lib/pcre/mix.sh
dev/doc/texinfo/mix.sh
{{super()}}
{% endblock %}

{% block coflags %}
--without-plugin-support
--with-ssl=gnutls
{% endblock %}

{% block patch %}
cat lib/xalloc-die.c | grep -v 'memory ex' > _ && mv _ lib/xalloc-die.c
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib ${out}/include ${out}/bin/wget2_noinstall
{% endblock %}
