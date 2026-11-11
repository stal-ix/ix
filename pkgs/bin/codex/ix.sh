{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.167.1
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
64bcc99c32e434b4bcb0508a97df9b7aeecdb97e956d976fb13661096ec4e3e2
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz
dc8a10a95df3878dda60a62b72acf9c1d1ee18599c04934952f128d9dcc78320
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
