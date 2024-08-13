{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/lapce/lapce/archive/refs/tags/v0.4.1.tar.gz
{% endblock %}

{% block cargo_sha %}
e82e1a7bb47e56352693cfcdc5f7f0d7a1d8871f95ac8602bd680281a4c1edeb
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/ssh/2
lib/git/2
lib/openssl
lib/wayland/dl
lib/mesa/gl/dl
lib/drivers/3d
lib/mesa/egl/dl
lib/xkb/common/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/lapce ${out}/bin/
mkdir -p ${out}/share/fonts
(
    find . -type f -name '*.ttf'
    find . -type f -name '*.otf'
) | while read l; do
    cp ${l} ${out}/share/fonts/
done
{% endblock %}
