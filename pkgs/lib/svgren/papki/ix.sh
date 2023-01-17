{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/papki/archive/refs/tags/1.0.119.tar.gz
sha:2e5730ab434d33b5f08ccc82977b3736edee30b3b7626b77df1934c123b17e31
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/svgren/utki
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
