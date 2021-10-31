{% extends '//mix/template/python/lib.sh' %}

{% block fetch %}
{% include '//dev/debug/gdb/version.sh' %}
{% endblock %}

{% block deps %}
# lib dev/lang/python/3/10/lib/package.sh
# bld pypi/pygments/package.py
{% endblock %}

{% block cflags %}
export PYTHONPATH="${PWD}/gdb/python/lib:${PYTHONPATH}"
{% endblock %}

{% block patch %}
cd gdb/python/lib/gdb

cat - __init__.py << EOF > _ && mv _ __init__.py
__file__ = '/nowhere/__init__.py'
EOF
{% endblock %}

{% block more_modules %}
cd gdb/python/lib && find . | grep '\.py$' | sed -e 's|./||' -e 's|\.py||' -e 's|/|.|g'
{% endblock %}
