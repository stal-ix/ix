{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/signalapp/libsignal-protocol-c/archive/refs/tags/v2.3.3.tar.gz
sha:c22e7690546e24d46210ca92dd808f17c3102e1344cd2f9a370136a96d22319d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

