{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-utils
{% endblock %}

{% block version %}
1.2.15.2
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/utils/alsa-utils-{{self.version().strip()}}.tar.bz2
7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block configure_flags %}
--with-udev-rules-dir="${out}/share"
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
