{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/freetype/freetype-2.12.0.tar.xz
sha:ef5c336aacc1a079ff9262d6308d6c2a066dd4d2a905301c4adda9b354399033
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
