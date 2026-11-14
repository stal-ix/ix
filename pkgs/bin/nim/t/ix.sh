{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
nim
{% endblock %}

{% block version %}
2.4.2
{% endblock %}

{% block fetch %}
https://nim-lang.org/download/nim-{{self.version().strip()}}.tar.xz
b28bf4da1fce46dba9d16685c981b3d5e98de8db1b60d66f279b0bd2af2d8211
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block nim_cpu %}
{{{'x86_64': 'amd64', 'aarch64': 'arm64', 'armv7': 'arm'}.get(target.gnu_arch, target.gnu_arch)}}
{% endblock %}

{% block nim_os %}
{{{'darwin': 'macosx', 'mingw32': 'windows'}.get(target.os, target.os)}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share/nim/bin
cp bin/nim{{target.exe_suffix}} ${out}/share/nim/bin/
cp -R lib config ${out}/share/nim/
ln -s ../share/nim/bin/nim{{target.exe_suffix}} ${out}/bin/nim{{target.exe_suffix}}
{% endblock %}
