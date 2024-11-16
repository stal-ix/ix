{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block install %}
mkdir ${out}/bin

{% for x in ['clang', 'clang++', 'clang-cpp', 'llvm-ar', 'llvm-nm', 'llvm-ranlib'] %}
cat << EOF > ${out}/bin/{{x}}
#!/usr/bin/env sh
export PATH=/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin
exec {{x}} "\${@}"
EOF
{% endfor %}

chmod +x ${out}/bin/*
{% endblock%}

{% block script_exec %}
["/usr/bin/env", "PATH=/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin", "/bin/sh", "-s"]
{% endblock %}
