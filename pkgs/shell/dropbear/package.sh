{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://storage.yandexcloud.net/mix-cache/dropbear-2020.81.tar.bz2
# md5 a07438a6159a24c61f98f1bce2d479c0
{% endblock %}

{% block deps %}
# bld lib/z/package.sh
# bld lib/tom/math/package.sh
# bld lib/tom/crypt/package.sh
# bld env/std/package.sh
# bld dev/build/make/package.sh
{% endblock %}

{% block coflags %}
--disable-bundled-libtom
{% endblock %}
