{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/r4/archive/refs/tags/1.0.70.tar.gz
sha:28d7aba597714bf2b9163de1afebd61f4d0ec4ca9eaa22302536040ecc768ed1
{% endblock %}

{% block lib_deps %}
lib/c
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
