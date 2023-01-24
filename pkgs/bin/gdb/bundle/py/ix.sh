{% extends '//die/python/freeze.sh' %}

{% block fetch %}
{% include '//bin/gdb/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/python
{% endblock %}

{% block bld_libs %}
pip/pygments
{% endblock %}

{% block setup %}
export PYTHONPATH="${PWD}/gdb/python/lib:${PYTHONPATH}"
{% endblock %}

{% block patch %}
cd gdb/python/lib/gdb

cat - __init__.py << EOF > _
__file__ = '/nowhere/__init__.py'
EOF

mv _ __init__.py
{% endblock %}

{% block more_modules %}
cd gdb/python/lib && find . | grep '\.py$' | sed -e 's|./||' -e 's|\.py||' -e 's|/|.|g'
{% endblock %}
