{% extends '//die/std/ix.sh' %}

{% block fetch %}
{{ix_url}}
{{ix_sha}}
{% endblock %}

{% block bld_tool %}
bin/unzip
{% endblock %}

{% block step_unpack %}
mkdir ${out}/bin
unzip -d ${out}/bin/ ${src}/*.zip
{% endblock %}

{% block install %}
cd ${out}/bin
bin=$(echo */ix)
cat << EOF > ix
#!/usr/bin/env sh
exec ${PWD}/${bin} "\${@}"
EOF
chmod +x ix
{% endblock %}

{% block postinstall %}
:
{% endblock %}
