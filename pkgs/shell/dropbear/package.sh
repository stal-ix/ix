{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://storage.yandexcloud.net/mix-cache/dropbear-2020.81.tar.bz2
# md5 a07438a6159a24c61f98f1bce2d479c0
{% endblock %}

{% block deps %}
# bld lib/z lib/tom/math lib/tom/crypt env/std dev/build/make
{% endblock %}

{% block coflags %}
--disable-bundled-libtom
{% endblock %}
