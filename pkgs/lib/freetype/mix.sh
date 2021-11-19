{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/freetype/freetype-2.11.0.tar.xz
f931582653774e310ed3a7e49b7167a3
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/bzip2/mix.sh
lib/png/mix.sh
lib/brotli/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2.69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
cat autogen.sh | sed -e 's|\./configure|\./configure; exit 0|' | dash
{% endblock %}

{% block coflags %}
{% endblock %}
