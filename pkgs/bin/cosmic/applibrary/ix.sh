{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-applibrary/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
3d99559e4932b7ecd3a3d9e611eb606166ec730c02f1b18134cc8af4efc6fcc2
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland/dl
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/xkb/common/dl
{% endblock %}
