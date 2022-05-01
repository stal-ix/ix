{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/freetype/freetype-2.12.1.tar.xz
sha:4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/bzip2
lib/brotli
{% endblock %}

{% block patch1 %}
sed -e 's|.*FT_CONFIG_OPTION_SUBPIXEL_RENDERING.*|#define FT_CONFIG_OPTION_SUBPIXEL_RENDERING|' \
    -i include/freetype/config/ftoption.h
{% endblock %}
