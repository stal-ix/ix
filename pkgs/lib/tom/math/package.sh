{% extends '//util/make.sh' %}

{% block fetch %}
# url https://github.com/libtom/libtommath/releases/download/v1.2.0/ltm-1.2.0.tar.xz
# md5 159523e41d528ce72a0ce4ac3eabe274
{% endblock %}

{% block deps %}
# bld env/std dev/build/make
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -ltommath \${LDFLAGS}"
{% endblock %}
