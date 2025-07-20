{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cmocka
{% endblock %}

{% block version %}
1.1.8
{% endblock %}

{% block fetch %}
https://cmocka.org/files/1.1/cmocka-{{self.version().strip()}}.tar.xz
58435b558766d7f4c729ba163bdf3aec38bed3bc766dab684e3526ed0aa7c780
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
