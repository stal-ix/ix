{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.8.tar.bz2
sha:e140fa604c351f36bd72167c8860c69d81b964ae6ab53992d6434dde38e9333c
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
