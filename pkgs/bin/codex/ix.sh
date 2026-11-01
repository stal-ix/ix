{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.166.0
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
a0bf572d2f93f056c6712a6da348e96078dc84f3885fd7be67807ef389cb3978
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz
7588334fd47bc4003d970b70dfd4d1e4578491b1e9baa72976a4c2d7e97590da
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
extract0 ${src}/codex-x86_64-unknown-linux-musl.tar.gz
extract0 ${src}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -Dm755 codex-x86_64-unknown-linux-musl ${out}/bin/codex.exe
# code mode host is spawned by codex from its own bin dir, under this exact name
install -Dm755 codex-code-mode-host-x86_64-unknown-linux-musl ${out}/bin/codex-code-mode-host
{% endblock %}
