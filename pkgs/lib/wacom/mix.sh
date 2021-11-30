{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/archive/refs/tags/libwacom-1.12.tar.gz
1d2cff159404674d791f9b28be364c51
{% endblock %}

{% block lib_deps %}
lib/udev/g/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block meson_flags %}
-Dtests=disabled
{% endblock %}

{% block patch %}
find . | grep meson.build | while read l; do
    cat ${l} | sed -e 's|shared_library|library|g' > _ && mv _ ${l}
done
{% endblock %}
