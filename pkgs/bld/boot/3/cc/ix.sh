{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block install %}
echo "{{ix_boot_path}}"
mkdir ${out}/bin
{% if ix_boot_tool('clang++') %}
{% for x in ['clang', 'clang++', 'clang-cpp', 'llvm-ar', 'llvm-nm', 'llvm-ranlib'] %}
{% if not ix_boot_tool(x) %}
{{error(x + ' not in path')}}
{% endif %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
exec {{ix_boot_tool(x)}} "\${@}"
EOF
{% endfor %}
{% elif ix_boot_tool('g++') %}
{% for x in ['gcc', 'g++', 'ar', 'nm', 'ranlib', 'as', 'ld', 'cpp'] %}
{% if not ix_boot_tool(x) %}
{{error(x + ' not in path')}}
{% endif %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
exec {{ix_boot_tool(x)}} "\${@}"
EOF
{% endfor %}
{% else %}
error('shit happen')
{% endif %}
chmod +x ${out}/bin/*
{% endblock%}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "sh", "-s"]
{% endblock %}
