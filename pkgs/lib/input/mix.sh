{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libinput/libinput-1.19.2.tar.xz
2c7f2aa4032bacb562a535b74829c56d
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

{% block lib_deps %}
lib/udev/mix.sh
lib/mtdev/mix.sh
lib/wacom/mix.sh
lib/evdev/mix.sh
{% endblock %}

{% block meson_flags %}
-Ddebug-gui=false
-Dtests=false
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block patch %}
find . | grep meson.build | while read l; do
    cat ${l} | sed -e 's|shared_library|library|g' > _ && mv _ ${l}
done
{% endblock %}
