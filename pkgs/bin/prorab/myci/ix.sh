{% extends '//die/c/make.sh' %}

{% block pkg_name %}
myci
{% endblock %}

{% block version %}
0.1.231
{% endblock %}

{% block fetch %}
https://github.com/cppfw/myci/archive/refs/tags/{{self.version().strip()}}.tar.gz
899a6614876cf2a470988ec0f5d2ea5ea58c406f78a32c89acfb3d9a8528561e
{% endblock %}

{% block bld_tool %}
bin/prorab/base
bin/prorab/extra
{% endblock %}

{% block make_flags %}
-I ${PRORAB_DIR}
-I ${PRORAB_EXTRA_DIR}
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}
