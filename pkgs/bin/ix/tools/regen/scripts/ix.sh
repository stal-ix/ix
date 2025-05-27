{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_flt
{% include 'flt.py/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_repo
{% include 'repo.py/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_regen
{% include 'urls/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_urls_flt
{% include 'urls_flt.py/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_repo_export
{% include 'repo_export.sh/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_flt_upstream
{% include 'ix_flt_upstream.py/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_fetch
{% include 'ix_fetch.sh/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_match
{% include 'ix_match.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
