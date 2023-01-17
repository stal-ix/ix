{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/cssom/archive/refs/tags/0.2.1.tar.gz
sha:ad51e20002f50b509c89d17d5e8f3090658ec2f1ff4330df56089aab943c33e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
lib/svgren/papki
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
