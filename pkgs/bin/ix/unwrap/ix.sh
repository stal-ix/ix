{% extends '//die/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ix/archive/refs/tags/v2.tar.gz
sha:90c2bd5d5819bb95b589e4890d3b0aafd3f070097c6f72d24c47e784257f7815
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
