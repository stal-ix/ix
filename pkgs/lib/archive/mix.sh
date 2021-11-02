{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://libarchive.org/downloads/libarchive-3.5.2.tar.xz
# md5 2ba9f1f8c169aa9caf8e2d34dde323be
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/xz/mix.sh
lib/lz4/mix.sh
lib/intl/mix.sh
lib/zstd/mix.sh
lib/bzip2/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
{% endblock %}

{% block bld_deps %}
env/c/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}

{% block coflags %}
--without-xml2
{% endblock %}

{% block env %}
export CMFLAGS="-DCMAKE_USE_SYSTEM_LIBARCHIVE=ON \${CMFLAGS}"
{% endblock %}
