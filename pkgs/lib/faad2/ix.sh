{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
faad2
{% endblock %}

{% block version %}
2.11.3
{% endblock %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/{{self.version().strip()}}.tar.gz
860ab62087e336c1844a70e33196c1790b525fb9a9e7b6ac4fab1a1a4e4d5ce8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
