{% extends '//mix/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/refs/tags/v3.tar.gz
sha:ba583ec87e120f45dfe71a26ea5a4d17838d9fc5e470944ba967c2767ad40b0c
{% endblock %}

{% block bld_libs %}
lib/python
pip/minio
pip/jinja2
pip/certifi
pip/urllib3
pip/beautysh
pip/markupsafe
pip/setuptools
{% endblock %}

{% block more_modules %}
for m in core/*.py; do
    echo ${m} | sed -e 's|\.py||' | sed -e 's|/|.|'
done
{% endblock %}

{% block patch %}
cat - mix << EOF > _
__file__ = "${out}/bin/mix"
EOF

mv _ mix
{% endblock %}

{% block entry_point %}mix{% endblock %}
