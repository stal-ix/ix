{% extends '//mix/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/refs/tags/v4.tar.gz
sha:acd5fbba05e5e49677d53a7e308dc31fd3d02a43b60130836b528c4628177692
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
