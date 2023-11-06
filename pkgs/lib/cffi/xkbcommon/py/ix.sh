{% extends '//lib/cffi/xkbcommon/t/ix.sh' %}

{% block bld_libs %}
lib/cffi/py
pip/setuptools
{% endblock %}

{% block bld_tool %}
bld/pip
bin/unzip
bld/python/{{python_ver}}
{% endblock %}

{% block build %}
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block install %}
${NATIVE_PYTHON} setup.py install \
    --prefix=${out} \
    --install-lib=${out}
cd ${out}
mkdir lib
mv *.egg lib/
cd lib
unzip *.egg
py_exports > exports
cat exports
{% endblock %}

{% block patch %}
sed -e 's|setup_requires|setup_requires_xxx|' -e 's|install_requires|install_requires_xxx|' -i setup.cfg
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
