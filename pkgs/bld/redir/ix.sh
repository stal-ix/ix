{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF >> ${out}/bin/{{from}}
#!/usr/bin/env sh
exec {{to}} "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock %}
