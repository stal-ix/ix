{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/flacjacket/pywlroots/archive/refs/tags/v0.16.6.tar.gz
sha:9620095d04f51271d3b071dd2c7b52b20f33b077de7785afbe037e743ae0311c
{% endblock %}

{% block bld_libs %}
lib/cffi
lib/wlroots/16
pip/setuptools
lib/py/wayland
lib/cffi/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/python/{{python_ver}}(python_ver={{python_ver}},py_extra_modules=lib/cffi:lib/py/wayland)
{% endblock %}

{% block build %}
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block install %}
${NATIVE_PYTHON} setup.py install \
    --prefix=${out} \
    --install-lib=${out}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|distutils|setuptools|' -i setup.py
sed -e 's|= load_wlroots_version()|= "1.16.6"|' -i wlroots/ffi_build.py
{% endblock %}
