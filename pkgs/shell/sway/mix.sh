{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/sway/archive/refs/tags/1.6.1.tar.gz
0bff81d89e9f9236cf00d46119ae4442
{% endblock %}

{% block bld_libs %}
lib/wlroots/mix.sh
lib/wayland/mix.sh
lib/pcre/mix.sh
lib/json/c/mix.sh
lib/cairo/mix.sh
lib/pango/mix.sh
{% endblock %}

{% block bld_tool %}
lib/dlfcn/scripts/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

{% block run_deps %}
lib/xkbcommon/config/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dlist_insert=sway_list_insert -Dseat_create=sway_seat_create -Dseat_destroy=sway_seat_destroy -Dserver_init=sway_server_init ${CPPFLAGS}"

python3 $(command -v gen_dl_stubs.py) opengl {{mix.platform.target.os}} << EOF > dl.cpp
__driDriverGetExtensions_kms_swrast
EOF

clang ${CPPFLAGS} ${CFLAGS} ${CXXFLAGS} -c dl.cpp
llvm-ar q libxxx.a dl.o
ln -s ${lib_mesa}/lib/dri/kms_swrast_dri.so libyyy.a

export LDFLAGS="${PWD}/dl.o ${PWD}/libyyy.a ${LDFLAGS}"
{% endblock %}
