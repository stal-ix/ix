{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
claude-code
{% endblock %}

{% block version %}
2.1.223
{% endblock %}

{% block fetch %}
https://downloads.claude.ai/claude-code-releases/{{self.version().strip()}}/linux-x64/claude
98226474f802e3094d6a86c5ade8883c16206d0fcb5c400b7401c800063e99d7
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
