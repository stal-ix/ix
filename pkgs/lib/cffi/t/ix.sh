{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/python-cffi/cffi/archive/refs/tags/v1.16.0.tar.gz
sha:83414dab92270767261176d155908f18da846a4234dc195620f85a431d19e9d8
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
lib/python
{% endblock %}

{% block bld_libs %}
pip/setuptools
{% endblock %}

{% block bld_tool %}
bld/python/frozen(python_ver={{python_ver}})
{% endblock %}

{% block build %}
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block install %}
${NATIVE_PYTHON} setup.py install \
    --prefix=${out} \
    --install-lib=${out}
{% endblock %}

{% block patch %}
sed -e 's|install_requires.*pycparser.*|pass|' -i setup.py
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
