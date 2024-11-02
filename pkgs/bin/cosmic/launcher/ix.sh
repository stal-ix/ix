{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-launcher/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
6e0e7400bc8dcd741946346fd0cc91277d08179f30732ea24caf5ffb2f4b2bd6
{% endblock %}

{% block bld_libs %}
lib/xz
lib/glib
lib/zstd
lib/bzip/2
lib/wayland/dl
lib/drivers/3d
lib/xkb/common/dl
{% endblock %}
