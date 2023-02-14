{% extends '//die/c/make.sh' %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/prorab
bld/fake(tool_name=doxygen)
bld/fake(tool_name=lsb_release)
bld/fake(tool_name=clang-tidy)
{% endblock %}

{% block make_flags %}
-I ${PRORAB_DIR}
-I ${PRORAB_EXTRA_DIR}
{% endblock %}

{% block patch %}
rm -rf tests
{% endblock %}
