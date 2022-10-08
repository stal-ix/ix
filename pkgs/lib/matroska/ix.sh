{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Matroska-Org/libmatroska/archive/refs/tags/release-1.7.1.tar.gz
sha:64763443947833e6c17f1f555f4bb0df6c9f91881810d9d5e0f0bad3622d308b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ebml
{% endblock %}
