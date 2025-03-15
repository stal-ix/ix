{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/0.11.0.tar.gz
{% endblock %}

{% block cargo_sha %}
b70f057dc3f3abb60657f69b0e615c4f1d608f03e3545c35bbfa266fd9653561
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
