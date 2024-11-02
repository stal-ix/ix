{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-notifications/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
895526589a1d6d0b38e6fee776f8d8872bb892b7b9b52ed825662079ad726813
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland/dl
lib/mesa/gl/dl
lib/drivers/3d
lib/mesa/egl/dl
lib/xkb/common/dl
{% endblock %}
