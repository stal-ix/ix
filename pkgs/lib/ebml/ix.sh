{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Matroska-Org/libebml/archive/refs/tags/release-1.4.3.tar.gz
sha:bcd22b03a197918eb994b310b45b5eed2644763010444159bc8738f9432354ca
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
