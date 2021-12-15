{% extends '//mix/template/std/mix.sh' %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/0.60.2.tar.gz
a5d6cfcf776e145f2054d5eefb4bc110
{% endblock %}

{% block bld_tool %}
gnu/patch/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block run_deps %}
dev/tool/python/mix.sh
{% endblock %}

{% block build %}
cd ${out}

(
    ${untar} ${src}/0*

    ln -s meson* meson
    mkdir bin && cd bin
    ln -s ../meson/meson.py ./meson
)

(
    cd meson

    patch -p1 << EOF
{% include '00.diff' %}
EOF
)
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}
