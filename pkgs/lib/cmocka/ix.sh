{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://cmocka.org/files/1.1/cmocka-1.1.7.tar.xz
sha:810570eb0b8d64804331f82b29ff47c790ce9cd6b163e98d47a4807047ecad82
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
