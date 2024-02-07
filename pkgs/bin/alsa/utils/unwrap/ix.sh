{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.10.tar.bz2
sha:104b62ec7f02a7ce16ca779f4815616df1cc21933503783a9107b5944f83063a
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

{% block build_flags %}
fix_shebangs
{% endblock %}

{% block patch %}
sed -e 's|install-data-hook|xxx|' -i Makefile.am
{% endblock %}

{% block cpp_defines %}
u_int8_t=uint8_t
u_int16_t=uint16_t
u_int32_t=uint32_t
u_int64_t=uint64_t
{% endblock %}
