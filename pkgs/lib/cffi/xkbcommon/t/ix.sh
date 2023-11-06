{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/sde1000/python-xkbcommon/archive/refs/tags/v0.8.tar.gz
sha:273c681eeebab773280605d9bdfe5c42767a16409c5b451106651031569c55e5
{% endblock %}

{% block bld_libs %}
pip/setuptools
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
sed -e 's|setup_requires|setup_requires_xxx|' -e 's|install_requires|install_requires_xxx|' -i setup.cfg
{% endblock %}
