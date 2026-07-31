{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
claude-code
{% endblock %}

{% block version %}
2.1.205
{% endblock %}

{% block fetch %}
https://downloads.claude.ai/claude-code-releases/{{self.version().strip()}}/linux-x64/claude
dd8734c0b6a503fe1d17425184e57b397c30bb0337a33f1470d9985febfe5b09
{% endblock %}

{% block bld_tool %}
bin/patch/elf
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -Dm755 ${src}/claude ${out}/bin/claude.bin
patchelf --set-interpreter /bin/ld-linux.so.2 ${out}/bin/claude.bin

cat << EOF > ${out}/bin/claude.exe
#!/usr/bin/env sh
set -eu
export LD_LIBRARY_PATH="/bin/usr/lib\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}"
exec "${out}/bin/claude.bin" "\$@"
EOF

chmod +x ${out}/bin/claude.exe
{% endblock %}

{% block postinstall %}
:
{% endblock %}
