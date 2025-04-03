{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/0/env
{% endblock %}

{% block install %}
mkdir ${out}/bin

cat << EOF > ${out}/bin/sh
#!/bin/sh
export PATH={{ix_boot_path}}
exec sh "\${@}"
EOF

chmod +x ${out}/bin/*
{% endblock%}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "env", "sh", "-s"]
{% endblock %}
