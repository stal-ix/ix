{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.5.3.tar.gz
sha:726e1de7cc8500e909a621c76cf5706d7bf5b701e69b28bf3ce829dfa26553f2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
