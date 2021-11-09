{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://storage.yandexcloud.net/mix-cache/unrarsrc-6.0.6.tar.gz
4c89e2e5ecfe72a9d96478fb80f38c34
{% endblock %}

{% block bld_deps %}
lib/c++/mix.sh
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block build %}
make -j ${make_thrs} -f makefile
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -v -m755 unrar ${out}/bin/
{% endblock %}
