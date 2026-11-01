{% extends '//die/gen.sh' %}

{# strings(1) for configure probes that grep an object file for ASCII
   markers (x264's endian test): the llvm multicall driver carries no
   llvm-strings, and the printable runs are all those probes look at. #}
{% block install %}
mkdir ${out}/bin

cat << 'EOF' > ${out}/bin/strings
#!/usr/bin/env sh
exec grep -aoE '[[:print:]]{4,}' "${@}"
EOF

chmod +x ${out}/bin/*
{% endblock %}
