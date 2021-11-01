{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/mesonbuild/meson/releases/download/0.58.0/meson-0.58.0.tar.gz
# md5 18ac55e3d6a5acb17b5737eb2a15bb5b
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
{% endblock %}

{% block run_deps %}
{{'dev/lang/cctools/mix.sh' | darwin}}
dev/lang/python/3/minimal/mix.sh
dev/build/samurai/mix.sh
{% endblock %}

{% block build %}
cd ${out}

(
    ${untar} ${src}/meson*

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

{% block touch_yl %}
{% endblock %}
