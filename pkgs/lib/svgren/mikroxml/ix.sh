{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/mikroxml/archive/refs/tags/0.1.53.tar.gz
sha:8b7bce82328db531dbce71b99ad8d056737ccdcf4f75ea2168274939725e113a
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
