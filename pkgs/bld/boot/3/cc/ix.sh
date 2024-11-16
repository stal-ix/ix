{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block install %}
mkdir ${out}/bin

{% for x in ['clang', 'clang++', 'clang-cpp', 'llvm-ar', 'llvm-nm', 'llvm-ranlib'] %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
export PATH={{ix_boot_path}}
exec {{x}} "\${@}"
EOF
{% endfor %}

chmod +x ${out}/bin/*
{% endblock%}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
