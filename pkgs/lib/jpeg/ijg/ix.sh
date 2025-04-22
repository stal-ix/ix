{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jpeg
{% endblock %}

{% block version %}
9f
{% endblock %}

{% block fetch %}
http://www.ijg.org/files/jpegsrc.v{{self.version().strip()}}.tar.gz
sha:04705c110cb2469caa79fb71fba3d7bf834914706e9641a4589485c1f832565b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
