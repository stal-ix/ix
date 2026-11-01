{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
nim
{% endblock %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://nim-lang.org/download/nim-{{self.version().strip()}}.tar.xz
4fa00853bc6ac92ebdd924d8e2ce42509d3f708d76a3ffcc034e16288e0e0325
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
