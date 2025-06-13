{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libdaemon
{% endblock %}

{% block version %}
0.14
{% endblock %}

{% block fetch %}
http://0pointer.de/lennart/projects/libdaemon/libdaemon-{{self.version().strip()}}.tar.gz
fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
{% endblock %}
