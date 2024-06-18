{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.7.2.tar.gz
sha:331a1e617952217868beeef7964828500388abeeb502ea3436f16eec816426c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
