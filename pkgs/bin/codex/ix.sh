{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.171.0
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
01baa2e47809f8597be5b2f8abd4e4dfe3fb5bcb6e504c2fbaaad97056c15e8d
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz
d78619030c1b8d0a4d9c9c67667c1bfa23ad9d9edc63d87ffeaa86796f3d868c
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
