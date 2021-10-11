{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/kkos/oniguruma/releases/download/v6.9.7.1/onig-6.9.7.1.tar.gz
# md5 d39409a103dcd44425e37b88d642f22c
{% endblock %}

{% block deps %}
# bld dev/build/cmake env/std
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lonig \${LDFLAGS}"
export COFLAGS="--with-onig=${out} \${COFLAGS}"
{% endblock %}
