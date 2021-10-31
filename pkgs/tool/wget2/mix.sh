{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
# md5 b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block deps %}
# bld lib/brotli/mix.sh
# bld lib/zstd/mix.sh
# bld lib/nghttp2/mix.sh
# bld lib/xz/mix.sh
# bld lib/z/mix.sh
# bld lib/intl/mix.sh
# bld lib/iconv/mix.sh
# bld lib/wolfssl/mix.sh
# bld lib/bzip2/mix.sh
# bld lib/idn2/mix.sh
# bld lib/pcre/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld dev/doc/texinfo/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block coflags %}
--without-plugin-support
--with-ssl=wolfssl
{% endblock %}
