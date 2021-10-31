{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://storage.yandexcloud.net/mix-cache/unrarsrc-6.0.6.tar.gz
# md5 4c89e2e5ecfe72a9d96478fb80f38c34
{% endblock %}

{% block deps %}
# bld lib/cxx/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}

{% block build %}
make CXX=g++ CC=gcc -j ${make_thrs} -f makefile
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -v -m755 unrar ${out}/bin/
{% endblock %}
