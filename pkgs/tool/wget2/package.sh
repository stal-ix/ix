{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
# md5 b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block deps %}
# bld lib/brotli/package.sh
# bld lib/zstd/package.sh
# bld lib/nghttp2/package.sh
# bld lib/xz/package.sh
# bld lib/z/package.sh
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
# bld lib/wolfssl/package.sh
# bld lib/bzip2/package.sh
# bld lib/idn2/package.sh
# bld lib/pcre/package.sh
# bld dev/build/make/package.sh
# bld dev/build/pkg-config/package.sh
# bld dev/doc/texinfo/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--without-plugin-support
--with-ssl=wolfssl
{% endblock %}
