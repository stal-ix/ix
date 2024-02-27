{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://0pointer.de/lennart/projects/libdaemon/libdaemon-0.14.tar.gz
sha:fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-examples
{% endblock %}
