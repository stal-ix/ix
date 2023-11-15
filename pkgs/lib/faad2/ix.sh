{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/2.11.1.tar.gz
sha:72dbc0494de9ee38d240f670eccf2b10ef715fd0508c305532ca3def3225bb06
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
