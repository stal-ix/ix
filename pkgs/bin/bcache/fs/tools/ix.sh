{% extends '//die/rust/cargo.sh' %}

{% include 'ver.sh' %}

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
cp ${tmp}/out/bcachefs ${out}/bin/
{% endblock %}
