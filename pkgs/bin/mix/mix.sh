{% extends '//mix/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/refs/tags/v2.tar.gz
sha:f3fce3eb47ebd37f19f5c7a6eb99446be646932ccb227dee5cc9d919f94e221c
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
cat - mix << EOF > mix_bin
__file__ = "${out}/bin/mix"
EOF

mv mix_bin mix
{% endblock %}

{% block entry_point %}mix{% endblock %}
