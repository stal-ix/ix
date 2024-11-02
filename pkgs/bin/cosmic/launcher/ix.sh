{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-launcher/archive/refs/tags/epoch-1.0.0-alpha.2.tar.gz
{% endblock %}

{% block cargo_sha %}
87ff5d16a1bbd581ed758d5c15cf65cab327e93f4b0c9cd383b12b701ef7d364
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
