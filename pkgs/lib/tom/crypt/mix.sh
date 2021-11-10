{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/libtom/libtomcrypt/releases/download/v1.18.2/crypt-1.18.2.tar.xz
e8d22351b7c95bef423c1cd02dcf836d
{% endblock %}

{% block lib_deps %}
lib/tom/math/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-DUSE_LTM -DLTM_DESC ${CFLAGS}"
{% endblock %}
