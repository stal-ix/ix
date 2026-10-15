{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
chafa
{% endblock %}

{% block version %}
1.18.3
{% endblock %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/{{self.version().strip()}}.tar.gz
677f48671d75b82875ade32a2a1ff971c3f44088e6a158beecca51260e0e616e
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
