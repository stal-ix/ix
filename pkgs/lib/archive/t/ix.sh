{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libarchive
{% endblock %}

{% block version %}
3.8.9
{% endblock %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
744346f6bca195c8f894f847bb32a16e9bcae6002624a58fadc81e80f595b3cb
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% if mingw32 %}
CMAKE_RC_COMPILER={{target.gnu.three}}-windres
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
{% endblock %}
