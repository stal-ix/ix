{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libudev-zero
{% endblock %}

{% block version %}
1.0.5
{% endblock %}

{% block fetch %}
https://github.com/illiliti/libudev-zero/archive/refs/tags/{{self.version().strip()}}.tar.gz
bf4372f79ddbe6b0e266a3d2994ffac7018a7edf4f87632aecb5176565d96138
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
