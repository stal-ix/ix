{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block install %}
mkdir ${out}/bin
{% if ix_boot_tool('clang++') %}
{% for x in ['clang', 'clang++', 'clang-cpp', 'llvm-ar', 'llvm-nm', 'llvm-ranlib'] %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
export PATH={{ix_boot_path}}
exec {{x}} "\${@}"
EOF
{% endfor %}
{% else %}
{% for x in ['gcc', 'g++', 'ar', 'nm', 'ranlib', 'as', 'ld', 'cpp'] %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
export PATH={{ix_boot_path}}
exec {{x}} "\${@}"
EOF
{% endfor %}
{% endif %}

chmod +x ${out}/bin/*
{% endblock%}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
