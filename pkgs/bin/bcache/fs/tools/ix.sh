{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/koverstreet/bcachefs-tools/archive/refs/tags/v1.11.0.tar.gz
{% endblock %}

{% block cargo_sha %}
6db9e2832d51847a74d2a73d8cb31c9e727ed9547862858c1676ee207c414900
{% endblock %}

{% block bld_libs %}
lib/z
lib/ffi
lib/ncurses
lib/llvm/18
lib/bcache/fs
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/llvm/config
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"runtime"|"static"|' \
    -i vendored/bindgen/Cargo.toml
{% endblock %}

{% block build %}
>libbcachefs.a
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/bcachefs ${out}/bin/
{% endblock %}
