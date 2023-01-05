{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.4.2.tar.gz
sha:a1332252956760c4907ed3c4f27e42c6d5239fbca0519b09f45e96856bef3abb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
