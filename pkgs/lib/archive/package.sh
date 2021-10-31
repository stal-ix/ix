{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://libarchive.org/downloads/libarchive-3.5.2.tar.xz
# md5 2ba9f1f8c169aa9caf8e2d34dde323be
{% endblock %}

{% block deps %}
# lib lib/z/package.sh
# lib lib/xz/package.sh
# lib lib/lz4/package.sh
# lib lib/intl/package.sh
# lib lib/zstd/package.sh
# lib lib/bzip2/package.sh
# lib lib/iconv/package.sh
# lib lib/expat/package.sh
# bld dev/build/make/package.sh
# bld env/tools/package.sh
# bld env/c/package.sh
# bld env/bootstrap/package.py
{% endblock %}

{% block coflags %}
--without-xml2
{% endblock %}

{% block env %}
export CMFLAGS="-DCMAKE_USE_SYSTEM_LIBARCHIVE=ON -DLibArchive_LIBRARY=${out}/lib/libarchive.a -DLibArchive_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}
