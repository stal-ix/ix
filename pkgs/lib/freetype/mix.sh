{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/freetype/freetype-2.11.0.tar.xz
sha:8bee39bd3968c4804b70614a0a3ad597299ad0e824bc8aad5ce8aaf48067bde7
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/bzip2
lib/brotli
{% endblock %}

{% block autoreconf %}
cat autogen.sh | sed -e 's|\./configure|\./configure; exit 0|' | sh
{% endblock %}

{% block patch %}
sed -e 's|.*FT_CONFIG_OPTION_SUBPIXEL_RENDERING.*|#define FT_CONFIG_OPTION_SUBPIXEL_RENDERING|' \
    -i include/freetype/config/ftoption.h
{% endblock %}
