{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_regen
{% include 'urls/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_urls_flt
{% include 'urls_flt.py/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_repo_export
{% include 'repo_export.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
