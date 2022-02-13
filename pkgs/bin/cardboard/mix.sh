{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.com/cardboardwm/cardboard/-/archive/b54758d85164fb19468f5ca52588ebea576cd027/cardboard-b54758d85164fb19468f5ca52588ebea576cd027.tar.bz2
sha:b28a61c021247f87ff017a70da46c6b253aa373bf62194b644e640e47e939542
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/cereal
lib/wayland
lib/expected
lib/xkbcommon
lib/wlroots/12
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block patch %}
for x in libcardboard/meson.build cutter/meson.build; do
    sed -e 's|.*cereal.*||'   \
        -e 's|.*expected.*||' \
        -i ${x}
done

base64 -d << EOF > cardboard/meson.build
{% include 'meson.build/base64' %}
EOF

>cardboard/wlr_cpp_fixes/include/wlr_cpp_fixes/xwayland.h

sed -e 's|grab_data = GrabState|grab_data = *new GrabState|' \
    -i cardboard/Seat.cpp
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
