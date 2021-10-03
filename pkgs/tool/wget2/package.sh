{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
# md5 b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block deps %}
# bld lib/brotli lib/zstd lib/nghttp2 lib/xz lib/z lib/intl lib/iconv
# bld lib/wolfssl lib/bzip2 lib/idn2 lib/pcre
# bld dev/build/make dev/build/pkg-config dev/doc/texinfo env/std
{% endblock %}

{% block coflags %}
--without-plugin-support
--with-ssl=wolfssl
{% endblock %}
