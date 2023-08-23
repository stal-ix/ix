{% extends '//bin/qemu/t/ix.sh' %}

{% block git_repo %}
https://github.com/qemu/qemu
{% endblock %}

{% block git_branch %}
v8.1.0
{% endblock %}

{% block git_sha %}
b4a67d01bb014460f7942bbaabc1864887b4fcb40eaa78cab44095eb2c6c7eac
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/fdt
{% endblock %}

{% block git_refine %}
rm roms/edk2/EmulatorPkg/Unix/Host/X11IncludeHack
{% endblock %}
