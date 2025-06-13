{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-utils
{% endblock %}

{% block version %}
1.2.14
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/utils/alsa-utils-{{self.version().strip()}}.tar.bz2
0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741
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
