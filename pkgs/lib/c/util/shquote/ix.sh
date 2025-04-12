{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
c-shquote
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/c-util/c-shquote/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:396fddb4ad0855ae0c68ac104b9a7efd10d92c72eac60ba29e94abdb6dca3279
{% endblock %}

{% block lib_deps %}
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
