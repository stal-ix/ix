{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/illiliti/libudev-zero/archive/refs/tags/1.0.2.tar.gz
sha:29dff942cab9519994fb92ba6407f57e08d3dd6e6c0b86bb93d7b1d681994ff8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block make_target %}
libudev.a
{% endblock %}

{% block make_install_target %}
install-static
{% endblock %}
