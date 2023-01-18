{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/prorab-extra/archive/refs/tags/0.2.43.tar.gz
sha:2bd27a510b2451cc799a1928c66b47102241cd603c08a15798de4920e079c4da
{% endblock %}

{% block bld_tool %}
bin/prorab/base
bld/fake(tool_name=lsb_release)
{% endblock %}

{% block make_flags %}
-I ${PRORAB_DIR}
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export PRORAB_EXTRA_DIR=${out}/include
{% endblock %}
