{% extends '//die/rust/cargo.sh' %}

{% include '//bin/scx/c/ver.sh' %}

{% block cargo_url %}
{{self.source_url().strip()}}
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

{% block cargo_tool %}
bld/cargo/83
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/bpf/clang
bld/rust/helpers/patch/bindgen
{% endblock %}

{% block binary %}
{% endblock %}

{% block cargo_packages %}
{{self.binary().strip()}}
{% endblock %}

{% block patch %}
{{super()}}
patch_bindgen vendored
{% endblock %}

{% block build %}
export BPF_CLANG=bpf_clang
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/{{self.binary().strip()}} ${out}/bin/
{% endblock %}
