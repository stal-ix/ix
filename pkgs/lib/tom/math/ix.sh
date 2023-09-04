{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libtom/libtommath/releases/download/v1.2.1/ltm-1.2.1.tar.xz
sha:986025d7b374276fee2e30e99f3649e4ac0db8a02257a37ee10eae72abed0d1f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
