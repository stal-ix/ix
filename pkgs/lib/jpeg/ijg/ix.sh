{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
jpeg
{% endblock %}

{% block version %}
10
{% endblock %}

{% block fetch %}
http://www.ijg.org/files/jpegsrc.v{{self.version().strip()}}.tar.gz
8b9eaa13242690ebd03e1728ab1edf97a81a78ed6e83624d493655f31ac95ab5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
