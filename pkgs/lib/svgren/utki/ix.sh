{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/utki/archive/refs/tags/1.1.182.tar.gz
sha:0f433eb3670b9ebf53480f03e47bf6221664d00998a932c9c4f435ecaa7103ed
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
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
