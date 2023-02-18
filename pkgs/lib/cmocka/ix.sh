{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://cmocka.org/files/1.1/cmocka-1.1.6.tar.xz
sha:5b3283038ddee236e7cb410ff217a31e66a651674838eb51a8ff0e1eba737a76
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
