{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/freetype/freetype-2.11.0.tar.xz
f931582653774e310ed3a7e49b7167a3
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/bzip2
lib/png
lib/brotli
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
cat autogen.sh \
    | sed -e 's|\./configure|\./configure; exit 0|' \
    | dash
{% endblock %}
