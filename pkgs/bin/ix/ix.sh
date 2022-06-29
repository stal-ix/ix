{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ix/archive/refs/tags/v1.tar.gz
sha:76e2eab6b1047364d0ba2a3101edbd787b75fa94ddaa8479410dd526af142230
{% endblock %}

{% block bld_libs %}
lib/python
pip/jinja2
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
