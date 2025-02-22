{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/runner_entry
#!/usr/bin/env dash
. "\${1}"
shift
{% if inherit %}
export PATH="\${OLDPATH}:\${PATH}"
{% endif %}
exec "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock %}
