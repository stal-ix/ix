{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-comp/archive/refs/tags/epoch-1.0.0-alpha.1.tar.gz
{% endblock %}

{% block cargo_sha %}
e73d203c5417de8f063ffce8b77a3cfee9f2541b6b244540c9bf1c2bcb94a5f4
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block build %}
export VERGEN_GIT_COMMIT_DATE="x"
export VERGEN_GIT_SHA="x"
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
lib/seat
lib/udev
lib/input
lib/pixman
lib/wayland/dl
lib/mesa/gl/dl
lib/drivers/3d
lib/mesa/egl/dl
lib/xkb/common/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cosmic-comp ${out}/bin/
{% endblock %}
