{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://files.pythonhosted.org/packages/f3/d4/25cc1e670f7ae478ffaefeecd6b968c049486c812e67e6e9fcc684bc0195/qtile-0.23.0.tar.gz
sha:eae63f7a939d9deac86d7251f75cafddbddf67e6e828feccee2f8ad745ed19ed
{% endblock %}

{% block bld_libs %}
lib/drm
pip/wheel
pip/setuptools
pip/setuptools_scm
bin/qtile/deps
{% endblock %}

{% block bld_tool %}
bin/git
bld/python/{{python_ver}}(py_extra_modules=bin/qtile/deps,python_ver={{python_ver}})
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

{% block c_rename_symbol %}
wrapped_log_callback
py_callback
wrapped_log_init
{% endblock %}

{% block patch %}
sed -e 's|\[xcb\]||' \
    -e 's|.*xcffib.*1.*||' \
    -i setup.cfg
{% endblock %}
