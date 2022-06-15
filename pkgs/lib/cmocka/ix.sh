{% extends '//die/cmake.sh' %}

{% block fetch %}
https://cmocka.org/files/1.1/cmocka-1.1.5.tar.xz
sha:f0ccd8242d55e2fd74b16ba518359151f6f8383ff8aef4976e48393f77bba8b6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
