{% extends '//die/c/make.sh' %}

{% block pkg_name %}
prorab-extra
{% endblock %}

{% block version %}
0.2.61
{% endblock %}

{% block fetch %}
https://github.com/cppfw/prorab-extra/archive/refs/tags/{{self.version().strip()}}.tar.gz
2c65df3efee0905277180f47e3b08c2cca7952820f9118decc99e24c51590975
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
