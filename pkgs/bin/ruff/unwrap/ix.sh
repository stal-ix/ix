{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ruff
{% endblock %}

{% block version %}
0.17.6
{% endblock %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4831f80a0d4d52d1cd80c626c9027b61180dee90582a8fc0155da6deeae97bd3
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

{% block cargo_tool %}
bld/rust/97
{% endblock %}
