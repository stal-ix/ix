{% extends '//die/c/make.sh' %}

{% block version %}
29
{% endblock %}

{% block pkg_name %}
wireless-tools
{% endblock %}

{% block fetch %}
https://hewlettpackard.github.io/wireless-tools/wireless_tools.{{self.version().strip()}}.tar.gz
sha:6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/shim/gnu/basename/overlay
{% endblock %}

{% block make_flags %}
BUILD_STATIC=y
INSTALL_DIR=${out}/bin
{% endblock %}
