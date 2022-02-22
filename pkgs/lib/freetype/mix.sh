{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/freetype/freetype-2.11.1.tar.xz
sha:3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8
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
