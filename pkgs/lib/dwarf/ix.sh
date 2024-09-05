{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.11.0.tar.xz
sha:846071fb220ac1952f9f15ebbac6c7831ef50d0369b772c07a8a8139a42e07d2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
