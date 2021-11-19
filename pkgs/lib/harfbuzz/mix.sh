{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/3.1.1.tar.gz
6d0a0359efda30ec8e5611f9006120b7
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
lib/darwin/framework/CoreText/mix.sh
lib/darwin/framework/ApplicationServices/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block meson_flags %}
-Ddefault_library=static
-Dcoretext=enabled
{% endblock %}
