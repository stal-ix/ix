{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
{% include 'ver.sh' %}
{% endblock %}

{% block cargo_sha %}
ef400d4a868d791e0aa8455adff22aec68500906578e93b85661cbb5d82c6d72
{% endblock %}

{% block bld_libs %}
lib/llvm/19
lib/bcache/fs
lib/shim/fake(lib_name=ffi)
lib/shim/fake(lib_name=ncursesw)
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
