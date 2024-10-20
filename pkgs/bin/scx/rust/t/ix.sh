{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sched-ext/scx/archive/fb3f1d0b43d8a1f69cbc434f4a43145dbd983076.tar.gz
{% endblock %}

{% block cargo_sha %}
734999cb82ad41e1eab2baadcc4496356d427b878c77883314495d006464a97f
{% endblock %}

{% block bld_libs %}
lib/bpf
lib/kernel
lib/llvm/19
lib/shim/fake(lib_name=ffi)
lib/shim/fake(lib_name=ncursesw)
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/bpf/clang
bld/llvm/config
{% endblock %}

{% block binary %}
{% endblock %}

{% block cargo_options %}
--package {{self.binary().strip()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"runtime"|"static"|' \
    -i vendored/bindgen/Cargo.toml
ln -s ../../scheds/include rust/scx_utils/bpf_h
ln -s ../../scheds/include rust/scx_rustland_core/bpf_h
{% endblock %}

{% block build %}
export BPF_CLANG=bpf_clang
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/{{self.binary().strip()}} ${out}/bin/
{% endblock %}
