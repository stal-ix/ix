{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
{% include '//bin/scx/c/ver.sh' %}
{% endblock %}

{% block cargo_sha %}
bfa8e726032ea12b620d033e11970e607290781251fbabe41db820144211b38d
{% endblock %}

{% block bld_libs %}
lib/bpf
lib/kernel
{% endblock %}

{% block host_libs %}
{{super()}}
lib/bpf
lib/llvm/19
{% endblock %}

{% block cargoc_ver %}
83
{% endblock %}

{% block rustc_ver %}
83
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/bpf/clang
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
cat << EOF > vendored/clang-sys/build/static.rs
pub fn link() {
}
EOF
{% endblock %}

{% block build %}
export BPF_CLANG=bpf_clang
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/{{self.binary().strip()}} ${out}/bin/
{% endblock %}
