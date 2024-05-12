{% extends '//die/std/ix.sh' %}

{% block fetch %}
{{ix_url}}
{{ix_sha}}
{% endblock %}

{% block bld_tool %}
bin/unzip
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share/ix

cp ${src}/*.zip ${out}/share/ix/ix.zip

base64 -d << EOF > ${out}/share/ix/ix.py
{% include 'ix.py/base64' %}
EOF

base64 -d << EOF > ${out}/share/ix/mount.py
{% include 'mo.py/base64' %}
EOF

cat << EOF > ${out}/bin/ix
#!/usr/bin/env sh
data="${out}/share/ix"
root="$(unzip -l ${out}/share/ix/ix.zip | head -n 10 | grep 'README.md' | sed -e 's|.* ||' | sed -e 's|/.*||')"
EOF

base64 -d << EOF >> ${out}/bin/ix
{% include 'ix/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}
