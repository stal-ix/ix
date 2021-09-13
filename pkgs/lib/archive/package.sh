{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://libarchive.org/downloads/libarchive-3.5.1.tar.xz
# md5 1f8c29149832baff8bae232fd2f9b0ec
{% endblock %}

{% block deps %}
# lib lib/z lib/xz lib/lz4 lib/intl lib/zstd lib/bzip2 lib/iconv lib/expat
# bld dev/build/make env/tools env/c env/bootstrap
{% endblock %}

{% block coflags %}
--without-xml2
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -larchive \$LDFLAGS"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DCMAKE_USE_SYSTEM_LIBARCHIVE=ON -DLibArchive_LIBRARY=${out}/lib/libarchive.a -DLibArchive_INCLUDE_DIR=${out}/include \$CMFLAGS"
{% endblock %}
