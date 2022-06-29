{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/libtom/libtomcrypt/releases/download/v1.18.2/crypt-1.18.2.tar.xz
md5:e8d22351b7c95bef423c1cd02dcf836d
{% endblock %}

{% block lib_deps %}
lib/c
lib/tom/math
{% endblock %}

{% block cpp_defines %}
USE_LTM
LTM_DESC
{% endblock %}
