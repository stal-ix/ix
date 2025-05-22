{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ruff
{% endblock %}

{% block version %}
0.11.10
{% endblock %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
396441d7e2f0c0633d71ed3a5179caf73a8cc9e0c9ec1580221b45660a91e07c
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

{% block rustc_ver %}
86
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}
