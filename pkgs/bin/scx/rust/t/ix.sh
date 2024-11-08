{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
{% include '//bin/scx/c/ver.sh' %}
{% endblock %}

{% block cargo_sha %}
4a54b6f0c453f4b1fa9d6f17359ba98a2d31b296424f01d1df9a408107dd7dca
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

{% block cargo_packages %}
{{self.binary().strip()}}
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
cp ${tmp}/out/{{self.binary().strip()}} ${out}/bin/
{% endblock %}
