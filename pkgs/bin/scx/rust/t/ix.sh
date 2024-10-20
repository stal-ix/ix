{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sched-ext/scx/archive/refs/tags/v1.0.5.tar.gz
{% endblock %}

{% block cargo_sha %}
f01d770704663bb3feb10e070e8eab88a55ad29978eafb9817d941cb1be653d1
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
