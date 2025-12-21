{% extends '//die/gen.sh' %}

{% block bld_deps %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/wrapcc
#!/usr/bin/env sh
exec "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock%}

{% block script_parts %}
/usr/bin/env
PATH={{ix_boot_path}}
env
sh
-s
{% endblock %}
