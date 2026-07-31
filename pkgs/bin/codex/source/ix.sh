{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.130.0
{% endblock %}

{% block cargo_url %}
https://github.com/openai/codex/archive/refs/tags/rust-v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
303091e36d796b056966b5534f925823a1998fff443313fe4c7a764ab7c424f5
{% endblock %}

{% block cargo_refine_unpack %}
mv codex-rs ../__sub__
find . -mindepth 1 -delete
find ../__sub__ -mindepth 1 -maxdepth 1 -exec mv {} . \;
rmdir ../__sub__
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
{% endblock %}

{% block cargo_packages %}
codex-cli
{% endblock %}

{% block cargo_bins %}
codex
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/codex ${out}/bin/codex.exe
{% endblock %}
