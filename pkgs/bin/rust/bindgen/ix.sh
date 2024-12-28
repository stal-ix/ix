{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/rust-lang/rust-bindgen/archive/refs/tags/v0.71.1.tar.gz
{% endblock %}

{% block cargo_sha %}
4e58f7ed07ce1aff1a35e2749c42642b8e594196a9ff2ac7b8b8e1e14deddf8c
{% endblock %}

{% block bld_libs %}
lib/z
lib/llvm/19
{% endblock %}

{% block cargo_features %}
static
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/rust/helpers/patch/bindgen
{% endblock %}

{% block patch %}
{{super()}}
patch_bindgen
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bindgen ${out}/bin/
{% endblock %}
