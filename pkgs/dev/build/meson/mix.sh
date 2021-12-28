{% extends '//mix/template/std/mix.sh' %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/0.60.2.tar.gz
a5d6cfcf776e145f2054d5eefb4bc110
{% endblock %}

{% block bld_tool %}
gnu/patch
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block run_deps %}
dev/tool/python
{% endblock %}

{% block build %}
cd ${out}

(
    extract ${src}/0*

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

{% block strip_pc %}
{% endblock %}
