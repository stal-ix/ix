{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
c-utf8
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/c-util/c-utf8/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8f948eaaa4ac69393adf96632fd06174ca1531bb4bb0728355281411b87bdf7d
{% endblock %}

{% block lib_deps %}
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
