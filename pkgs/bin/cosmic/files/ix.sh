{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-files/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
518577985f28bee213c88461680dd2bc09223db9b86168a815dd66774d81821a
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
