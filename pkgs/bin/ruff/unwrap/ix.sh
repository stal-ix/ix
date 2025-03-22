{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/0.11.2.tar.gz
{% endblock %}

{% block cargo_sha %}
0e4ae3554c63cf2ce83ecb208368f84a2149865ba55fdec92974beb6319e7f2b
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
