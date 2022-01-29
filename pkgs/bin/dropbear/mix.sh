{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://storage.yandexcloud.net/mix-cache/dropbear-2020.81.tar.bz2
a07438a6159a24c61f98f1bce2d479c0
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/tom/math
lib/tom/crypt
{% endblock %}

{% block enable_static %}
{% endblock %}

{% block configure_flags %}
--disable-bundled-libtom
{% endblock %}
