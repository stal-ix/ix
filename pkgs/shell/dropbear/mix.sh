{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://storage.yandexcloud.net/mix-cache/dropbear-2020.81.tar.bz2
# md5 a07438a6159a24c61f98f1bce2d479c0
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/tom/math/mix.sh
# bld lib/tom/crypt/mix.sh
# bld env/std/mix.sh
# bld dev/build/make/mix.sh
{% endblock %}

{% block coflags %}
--disable-bundled-libtom
{% endblock %}
