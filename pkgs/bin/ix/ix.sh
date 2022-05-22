{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/refs/tags/v5.tar.gz
sha:e183a05cefaf80c7300f865c947bf31e36604e6513089e20fc2a02792fd08a8f
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
