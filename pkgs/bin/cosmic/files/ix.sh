{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-files/archive/refs/tags/epoch-1.0.0-alpha.2.tar.gz
{% endblock %}

{% block cargo_sha %}
db2a363e19cced2af836fc66aa3bf9f0b3e906efbcba02b006761d62f45790fa
{% endblock %}

{% block cargo_packages %}
cosmic-files
cosmic-files-applet
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
