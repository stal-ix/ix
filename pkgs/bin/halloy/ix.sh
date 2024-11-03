{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/squidowl/halloy/archive/refs/tags/2024.14.tar.gz
{% endblock %}

{% block cargo_sha %}
b655b20370d6b58c36a0e8207fc5fa153aa7ee84a90620968cd4ceaed87e5f63
{% endblock %}

{% block bld_libs %}
lib/alsa
lib/openssl
lib/wayland/dl
lib/mesa/gl/dl
lib/drivers/3d
lib/mesa/egl/dl
lib/xkb/common/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/halloy ${out}/bin/
{% endblock %}
