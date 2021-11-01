{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/wget/wget2-2.0.0.tar.gz
# md5 b774bb0da9cb84cb9f5bbbcbcc31d00e
{% endblock %}

{% block bld_deps %}
lib/brotli/mix.sh
lib/zstd/mix.sh
lib/nghttp2/mix.sh
lib/xz/mix.sh
lib/z/mix.sh
lib/intl/mix.sh
lib/iconv/mix.sh
lib/wolfssl/mix.sh
lib/bzip2/mix.sh
lib/idn2/mix.sh
lib/pcre/mix.sh
dev/build/make/mix.sh
dev/build/pkg-config/mix.sh
dev/doc/texinfo/mix.sh
env/std/mix.sh
{% endblock %}

{% block coflags %}
--without-plugin-support
--with-ssl=wolfssl
{% endblock %}
