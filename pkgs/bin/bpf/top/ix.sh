{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/Netflix/bpftop/archive/refs/tags/v0.6.0.tar.gz
{% endblock %}

{% block cargo_sha %}
6bad6b1476335cc58f4779c764fc8091c7a3b28a925737e72266675b5580fc44
{% endblock %}

{% block bld_libs %}
lib/z
lib/bpf
lib/kernel
lib/elfutils
{% endblock %}

{% block bld_tool %}
bin/bpf/clang
{% endblock %}

{% block patch %}
base64 -d << EOF > build.rs
{% include 'build.rs/base64' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bpftop ${out}/bin/
{% endblock %}

{% block cargoc_ver %}
bld/cargo/83
{% endblock %}
