{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/astral-sh/ruff/archive/refs/tags/0.9.6.tar.gz
{% endblock %}

{% block cargo_sha %}
26897ac3da13a0f43532323db923f4094f53f3955683fc3b003332c3ac8a4c81
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/ruff{{target.exe_suffix}} ${out}/bin/
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/shim/je
{% if mingw32 %}
lib/mimalloc/1
lib/build/muldefs
lib/shim/dll(dll_name=ole32)
lib/shim/dll(dll_name=netapi32)
lib/shim/dll(dll_name=shell32)
lib/shim/fake(lib_name=unwind)
lib/shim/fake(lib_name=windows.0.52.0)
lib/shim/fake(lib_name=windows.0.48.5)
{% endif %}
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
