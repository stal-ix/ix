{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/lz4/lz4/archive/refs/tags/v1.9.3.tar.gz
# md5 3a1ab1684e14fc1afc66228ce61b2db3
{% endblock %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/tools/mix.sh
# bld env/c/mix.sh
# bld env/bootstrap/package.py
{% endblock %}

{% block build %}
make PREFIX=${out} BUILD_SHARED=no -j ${make_thrs} allmost
{% endblock %}

{% block install %}
make PREFIX=${out} BUILD_SHARED=no install
{% endblock %}
