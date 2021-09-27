{% extends '//util/make.sh' %}

{% block fetch %}
# url https://github.com/libtom/libtomcrypt/releases/download/v1.18.2/crypt-1.18.2.tar.xz
# md5 e8d22351b7c95bef423c1cd02dcf836d
{% endblock %}

{% block deps %}
# lib lib/tom/math
# bld env/std dev/build/make
{% endblock %}

{% block build %}
make CFLAGS="-DUSE_LTM -DLTM_DESC ${CFLAGS}" -j ${make_thrs}
{% endblock %}

{% block install %}
make PREFIX=${out} install
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -ltomcrypt \${LDFLAGS}"
{% endblock %}
