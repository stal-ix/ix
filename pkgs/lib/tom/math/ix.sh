{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/libtom/libtommath/releases/download/v1.2.0/ltm-1.2.0.tar.xz
md5:159523e41d528ce72a0ce4ac3eabe274
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
