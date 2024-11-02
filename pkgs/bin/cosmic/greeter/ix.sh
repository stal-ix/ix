{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-greeter/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
b1463d268f70116b60f2e77a044f8356b6ccbd4d883fd2a118657fe53e273e9b
{% endblock %}

{% block bld_libs %}
lib/c
lib/opengl
lib/xkb/common
lib/wayland/dl
lib/drivers/3d
lib/mesa/egl/dl
{% endblock %}

{% block cargo_features %}
{% endblock %}
