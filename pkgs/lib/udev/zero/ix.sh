{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/illiliti/libudev-zero/archive/refs/tags/1.0.3.tar.gz
sha:0bd89b657d62d019598e6c7ed726ff8fed80e8ba092a83b484d66afb80b77da5
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
