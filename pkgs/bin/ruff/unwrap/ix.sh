{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ruff
{% endblock %}

{% block version %}
0.11.12
{% endblock %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ee156c9d24bb3544db1dae97b97a5eaa19b8e1ae4b8a0be345b74ef81772ed37
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
