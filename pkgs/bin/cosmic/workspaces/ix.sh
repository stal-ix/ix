{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-workspaces-epoch/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
97cfe444cae7110dec586be6e26c2111a686488e83e44f0da20d32269d5fb54a
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
lib/udev
lib/input
lib/opengl
lib/xkb/common
lib/wayland/dl
lib/drivers/3d
lib/mesa/egl/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cosmic-workspaces ${out}/bin/
{% endblock %}
