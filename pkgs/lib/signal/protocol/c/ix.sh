{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libsignal-protocol-c
{% endblock %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://github.com/signalapp/libsignal-protocol-c/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c22e7690546e24d46210ca92dd808f17c3102e1344cd2f9a370136a96d22319d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
