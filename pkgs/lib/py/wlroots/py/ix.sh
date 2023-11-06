{% extends '//lib/py/wlroots/t/ix.sh' %}

{% block bld_libs %}
lib/cffi
pip/setuptools
lib/py/wayland
lib/cffi/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/pip
bld/python/{{python_ver}}(python_ver={{python_ver}},py_extra_modules=lib/cffi)
{% endblock %}

{% block build %}
sed -e 's|distutils|setuptools|' -i setup.py
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block install %}
${NATIVE_PYTHON} setup.py install \
    --prefix=${out} \
    --install-lib=${out}
{% endblock %}

{% block patch %}
sed -e 's|.*cffi.*1.12.*||' -i pyproject.toml
sed -e 's|.*setup_requires.*||' -i setup.py
>requirements.txt
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
