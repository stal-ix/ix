{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
python:pywlroots
{% endblock %}

{% block version %}
0.17.0
{% endblock %}

{% block fetch %}
https://github.com/flacjacket/pywlroots/archive/refs/tags/v{{self.version().strip()}}.tar.gz
667b0cca499a99183c7834d0f656a0ed699a2b7d8b04939fabf0df575fd30bbe
{% endblock %}

{% block lib_deps %}
lib/wlroots/17
{% endblock %}

{% block bld_libs %}
lib/cffi
pip/setuptools
lib/py/wayland
lib/cffi/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/python/frozen(python_ver={{python_ver}},py_extra_modules=lib/cffi/module/register:lib/py/wayland/module/register)
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
sed -e 's|= load_wlroots_version()|= "0.16.2"|' -i wlroots/ffi_build.py
{% endblock %}
