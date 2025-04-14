{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcanberra
{% endblock %}

{% block version %}
0.30
{% endblock %}

{% block fetch %}
http://0pointer.de/lennart/projects/libcanberra/libcanberra-{{self.version().strip()}}.tar.xz
sha:c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72
{% endblock %}

{% block lib_deps %}
lib/c
lib/ltdl
lib/udev
lib/alsa
lib/xiph/vorbis
{% endblock %}

{% block configure_flags %}
--enable-alsa
--with-builtin=alsa
{% endblock %}
