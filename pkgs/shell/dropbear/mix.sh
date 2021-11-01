{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://storage.yandexcloud.net/mix-cache/dropbear-2020.81.tar.bz2
# md5 a07438a6159a24c61f98f1bce2d479c0
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/tom/math/mix.sh
lib/tom/crypt/mix.sh
env/std/mix.sh
dev/build/make/mix.sh
{% endblock %}

{% block coflags %}
--disable-bundled-libtom
{% endblock %}
