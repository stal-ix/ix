{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/0.11.5.tar.gz
{% endblock %}

{% block cargo_sha %}
4f6e8306bbc7541af73ee699a3e8a71202552fa5090588160e4529d0d3194868
{% endblock %}

{% block cargo_bins %}
ruff
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
bin/ruff/{{target.os}}
{{super()}}
{% endblock %}

{% block host_libs %}
lib/c
lib/zstd
{{super()}}
{% endblock %}

{% block cargo_flags %}
{{super()}}
--config 'target.x86_64-pc-windows-gnullvm.linker = "clang"'
{% endblock %}
