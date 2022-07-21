{% extends '//die/c/make.sh' %}

{% block fetch %}
https://hewlettpackard.github.io/wireless-tools/wireless_tools.29.tar.gz
sha:6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block make_flags %}
BUILD_STATIC=y
INSTALL_DIR=${out}/bin
{% endblock %}
