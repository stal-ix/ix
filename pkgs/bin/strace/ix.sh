{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://strace.io/files/5.18/strace-5.18.tar.xz
sha:60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db3d1187
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
