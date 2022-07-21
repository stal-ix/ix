{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.7.tar.bz2
sha:e906bf2404ff04c448eaa3d226d283a62b9a283f12e4fd8457fb24bac274e678
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block bld_libs %}
lib/c
lib/alsa
lib/udev
lib/intl
lib/curses
lib/samplerate
{% endblock %}

{% block configure_flags %}
--with-udev-rules-dir="${out}/share"
--with-curses=ncurses
{% endblock %}

{% block patch %}
sed -e 's|install-data-hook|xxx|' -i Makefile.am
{% endblock %}
