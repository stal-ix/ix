{% extends '//die/gen.sh' %}

{% block bld_deps %}
bld/boot/2/sbase
bld/boot/1/sh
bld/boot/1/env
{% endblock %}

{% block build %}
mkdir -p ${out}/bin
cat << EOF > ${out}/bin/xcrun
#!/usr/bin/env sh
exec "\${@}"
EOF
chmod +x ${out}/bin/xcrun
{% endblock %}
