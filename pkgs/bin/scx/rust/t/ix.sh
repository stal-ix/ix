{% extends '//die/rust/cargo.sh' %}

{% include '//bin/scx/c/ver.sh' %}

{% block cargo_url %}
{{self.source_url().strip()}}
{% endblock %}

{% block cargo_sha %}
9d5ca7956239ddae8714a71af15a3f47421642450516022d92836fa889e4150c
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
bld/cargo/86
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

{% block cargo_bins %}
{{self.binary().strip()}}
{% endblock %}
