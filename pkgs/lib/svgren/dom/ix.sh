{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/svgdom/archive/refs/tags/0.4.2.tar.gz
sha:f760445503ab1ff828e5014c6f9cf8c5c3d501dc850b12619e8d2fd66cfe90a6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/r4
lib/svgren/cssom
lib/svgren/mikroxml
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/prorab
{% endblock %}

{% block make_flags %}
-I ${PRORAB_DIR}
-I ${PRORAB_EXTRA_DIR}
{% endblock %}

{% block patch %}
rm -rf tests
{% endblock %}
