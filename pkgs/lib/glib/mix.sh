{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download-fallback.gnome.org/sources/glib/2.70/glib-2.70.1.tar.xz
fb613d21fabce3d3d8520f37d12bd473
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/pcre/mix.sh
lib/iconv/mix.sh
lib/ffi/mix.sh
lib/intl/mix.sh
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreServices/mix.sh
lib/darwin/framework/Foundation/mix.sh
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c++/mix.sh
{% endblock %}

{% block std_env %}
{% if target.os == 'darwin' %}
dev/lang/cctools/mix.sh
{% endif %}
dev/build/meson/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-D_GNU_SOURCE=1 -I${PWD}/inc ${CPPFLAGS}"
{% endblock %}

{% block meson_flags %}
-Diconv=external
-Dtests=false
{% endblock %}
