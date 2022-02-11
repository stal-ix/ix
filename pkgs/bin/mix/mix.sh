{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/82426ebbc6aeaf54cb6266a7127b2179264c25ef.zip
sha:cb72eb42c1d12cd3c2182d77eea530167b24b49066ba13cbaf2dd8b34b5e0494
{% endblock %}

{% block bld_libs %}
lib/python
pip/minio
pip/jinja2
pip/certifi
pip/urllib3
pip/beautysh
pip/setuptools
{% endblock %}

{% block more_modules %}
for m in core/*.py; do
    echo ${m} | sed -e 's|\.py||' | sed -e 's|/|.|'
done
{% endblock %}

{% block patch %}
cat - mix << EOF > mix_bin
__file__ = "${out}/bin/mix"
EOF

mv mix_bin mix
{% endblock %}

{% block entry_point %}mix{% endblock %}
