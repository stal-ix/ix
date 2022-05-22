{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/illiliti/libudev-zero/archive/refs/tags/1.0.1.tar.gz
sha:c4cf149ea96295c1e6e86038d10c725344c751982ed4a790b06c76776923e0ea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block make_target %}
libudev.a
{% endblock %}

{% block make_install_target %}
install-static
{% endblock %}
