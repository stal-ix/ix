{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://libarchive.org/downloads/libarchive-3.5.2.tar.xz
# md5 2ba9f1f8c169aa9caf8e2d34dde323be
{% endblock %}

{% block deps %}
# lib lib/z/mix.sh
# lib lib/xz/mix.sh
# lib lib/lz4/mix.sh
# lib lib/intl/mix.sh
# lib lib/zstd/mix.sh
# lib lib/bzip2/mix.sh
# lib lib/iconv/mix.sh
# lib lib/expat/mix.sh
# bld dev/build/make/mix.sh
# bld env/tools/mix.sh
# bld env/c/mix.sh
# bld env/bootstrap/mix.sh
{% endblock %}

{% block coflags %}
--without-xml2
{% endblock %}

{% block env %}
export CMFLAGS="-DCMAKE_USE_SYSTEM_LIBARCHIVE=ON -DLibArchive_LIBRARY=${out}/lib/libarchive.a -DLibArchive_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}
