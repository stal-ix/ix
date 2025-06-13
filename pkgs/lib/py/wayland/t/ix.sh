{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
pywayland
{% endblock %}

{% block version %}
0.4.18
{% endblock %}

{% block fetch %}
https://github.com/flacjacket/pywayland/archive/refs/tags/v{{self.version().strip()}}.tar.gz
89fb8585457f6e67313b461e2ebc2d8c06c751d2f3b45e7839dd957185496d86
{% endblock %}

{% block lib_deps %}
lib/c
lib/wayland
{% endblock %}

{% block bld_libs %}
lib/cffi
pip/setuptools
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
bld/python/frozen(py_extra_modules=lib/cffi/module/register,python_ver={{python_ver}})
{% endblock %}

{% block build %}
${NATIVE_PYTHON} setup.py build
{% endblock %}

{% block install %}
${NATIVE_PYTHON} setup.py install \
    --prefix=${out} \
    --install-lib=${out}/lib
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
