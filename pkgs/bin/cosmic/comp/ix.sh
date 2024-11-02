{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-comp/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
18136b41377687126bffae2cf89892586c1b2e36584a6488a93a034b7ef2828f
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
