{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.147.0
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
0246e2e773834e07f0fb5249ed6ebad12e4591e608f8c7bb97dd6a9690544c36
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
extract0 ${src}/codex-x86_64-unknown-linux-musl.tar.gz
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -Dm755 codex-x86_64-unknown-linux-musl ${out}/bin/codex.exe
{% endblock %}
