{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin

cat << EOF > ${out}/bin/valac
#!/usr/bin/env sh
echo XXXXXXXXXXXXXXXXXXXXXXXXXXX \${VALAFLAGS}
exec valac-0.56 \${VALAFLAGS} "\${@}"
EOF

cat << EOF > ${out}/bin/vapigen
#!/usr/bin/env sh
echo YYYYYYYYYYYYYYYYYYYYYYYyy \${VALAFLAGS}
exec vapigen-0.56 \${VALAFLAGS} "\${@}"
EOF

chmod +x ${out}/bin/*
{% endblock %}
