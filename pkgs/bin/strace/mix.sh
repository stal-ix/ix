{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/5.17/strace-5.17.tar.xz
sha:5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/elfutils
{% endblock %}

{% block configure_flags %}
--enable-mpers=no
--with-libdw
{% endblock %}
