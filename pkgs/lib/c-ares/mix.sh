{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/cares-1_18_1.tar.gz
a0ec0dd35fd6c06544333d250e21ab22
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block cmflags %}
-DCARES_STATIC=ON
-DCARES_SHARED=OFF
{% endblock %}

{% block env %}
export COFLAGS="--with-ares=${out} --enable-ares=${out} \${COFLAGS}"
export LDFLAGS="-lresolv \${LDFLAGS}"
{% endblock %}
