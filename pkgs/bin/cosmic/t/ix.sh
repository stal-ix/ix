{% extends '//die/rust/cargo.sh' %}

{% block bld_tool %}
{{super()}}
bin/just
bld/fakegit
{% endblock %}

{% block build %}
export VERGEN_GIT_COMMIT_DATE="x"
export VERGEN_GIT_SHA="x"
{{super()}}
{% endblock %}

{% block install %}
export CARGO_TARGET_DIR=${tmp}/{{target.rust}}
just --set prefix ${out} install
{% endblock %}

{% block bld_libs %}
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}
