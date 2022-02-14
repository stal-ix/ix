{% extends '//mix/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/mix/archive/refs/tags/v1.tar.gz
sha:a7e16569962c84629b2e0f1c583d0078dcd953374db994b36924d19a358e3dde
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
