{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ruff
{% endblock %}

{% block version %}
0.11.13
{% endblock %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
14db88e93621501818f0428a6ea509e5fcd5101c08519e4e52dbcb50ae89cef3
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
