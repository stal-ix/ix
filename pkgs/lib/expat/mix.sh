{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/libexpat/libexpat/releases/download/R_2_4_1/expat-2.4.1.tar.xz
# md5 a4fb91a9441bcaec576d4c4a56fa3aa6
{% endblock %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/tools/mix.sh
# bld env/c/mix.sh
# bld env/bootstrap/mix.sh
{% endblock %}

{% block coflags %}
--without-examples
{% endblock %}

{% block env %}
export COFLAGS="--with-expat=${out} --with-libexpat-prefix=${out} \${COFLAGS}"
export CMFLAGS="-DCMAKE_USE_SYSTEM_EXPAT=ON -DEXPAT_LIBRARY=${out}/lib/libexpat.a -DEXPAT_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}
