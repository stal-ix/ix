{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-files/archive/refs/tags/epoch-1.0.0-alpha.2.tar.gz
{% endblock %}

{% block cargo_sha %}
db2a363e19cced2af836fc66aa3bf9f0b3e906efbcba02b006761d62f45790fa
{% endblock %}

{% block bld_tool %}
bin/just
bld/fakegit
{% endblock %}

{% block build %}
export VERGEN_GIT_COMMIT_DATE="x"
export VERGEN_GIT_SHA="x"
{{super()}}
cargo build --offline --release {{ix.fix_list(cargo_options)}} --package cosmic-files-applet
{% endblock %}

{% block bld_libs %}
lib/xz
lib/glib
lib/zstd
lib/bzip/2
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}

{% block install %}
just --set prefix ${out} install
{% endblock %}
