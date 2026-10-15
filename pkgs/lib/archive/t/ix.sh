{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libarchive
{% endblock %}

{% block version %}
3.8.10
{% endblock %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6ec4ad1b96f92f9fe3a74bac2647e7b122a4496aa804e2fb9b50f2030283582c
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% if mingw32 %}
CMAKE_RC_COMPILER={{target.gnu.three}}-windres
HAVE_EXPLICIT_BZERO=OFF
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}

{% block bld_tool %}
{{super()}}
{% if mingw32 %}
bld/windres(for_target={{target.gnu.three}})
{% endif %}
{% endblock %}

{% block patch %}
sed -e 's|!defined(HAVE_LIBICONV)$|!defined(HAVE_LIBICONV) \&\& defined(ICONV_SET_ILSEQ_INVALID)|' \
    -i libarchive/archive_string.c
sed -e 's|__archive_read_seek(a, 0, SEEK_SET) < 0|__archive_read_seek(a, 0, SEEK_SET) == ARCHIVE_FATAL|' \
    -i libarchive/archive_read.c
sed -e '/^FILE_seek(/,/^}/ s|return (ARCHIVE_FATAL);|return (errno == ESPIPE ? ARCHIVE_FAILED : ARCHIVE_FATAL);|' \
    -i libarchive/archive_read_open_file.c
sed -e '/^file_seek(/,/^}/ s|return (ARCHIVE_FATAL);|return (errno == ESPIPE ? ARCHIVE_FAILED : ARCHIVE_FATAL);|' \
    -i libarchive/archive_read_open_filename.c
{% endblock %}
