{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
{% include '//bin/scx/c/ver.sh' %}
{% endblock %}

{% block cargo_sha %}
50bc2347311b57183878e932645387117ad916f49c8208570ed355930bd1184b
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
{% endblock %}

{% block build %}
export BPF_CLANG=bpf_clang
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/{{self.binary().strip()}} ${out}/bin/
{% endblock %}
