{% extends '//die/proxy.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block install %}
mkdir ${out}/bin

cat << EOF > ${out}/bin/egrep
#!/usr/bin/env sh
exec grep -E "\${@}"
EOF

cat << EOF > ${out}/bin/fgrep
#!/usr/bin/env sh
exec grep -F "\${@}"
EOF

cat << EOF > ${out}/bin/makeinfo
#!/usr/bin/env sh
EOF

chmod +x ${out}/bin/egrep ${out}/bin/fgrep ${out}/bin/makeinfo
{% endblock%}
