{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/agg/archive/refs/tags/2.8.17.tar.gz
sha:40a8d18682f29e11e29eff3d7cc5fab079c35578420191608be049bc9994b45f
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
