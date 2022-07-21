{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libtom/libtomcrypt/releases/download/v1.18.2/crypt-1.18.2.tar.xz
sha:96ad4c3b8336050993c5bc2cf6c057484f2b0f9f763448151567fbab5e767b84
{% endblock %}

{% block lib_deps %}
lib/c
lib/tom/math
{% endblock %}

{% block cpp_defines %}
USE_LTM
LTM_DESC
{% endblock %}
