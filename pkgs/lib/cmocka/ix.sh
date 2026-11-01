{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cmocka
{% endblock %}

{% block version %}
2.0.2
{% endblock %}

{% block fetch %}
https://cmocka.org/files/{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}/cmocka-{{self.version().strip()}}.tar.xz
39f92f366bdf3f1a02af4da75b4a5c52df6c9f7e736c7d65de13283f9f0ef416
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
