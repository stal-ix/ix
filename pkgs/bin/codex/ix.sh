{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.144.5
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
b6bea13bedf493232f6717714c45e783788c695cedcf37c344f73afc97b1ec9f
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
