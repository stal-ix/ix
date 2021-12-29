{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/freetype/freetype-2.11.1.tar.xz
24e79233d607ded439ef36ff1f3ab68f
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/bzip2
lib/brotli
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
cat autogen.sh | sed -e 's|\./configure|\./configure; exit 0|' | dash
{% endblock %}
