{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/refs/tags/v6.tar.gz
sha:9ea5159d448ef2ea6b12a26fbdb70254a3bceb1a9396268f724853fbf54e176d
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
cat - ix << EOF > _
__file__ = "${out}/bin/ix"
EOF

mv _ ix
{% endblock %}

{% block entry_point %}ix{% endblock %}
