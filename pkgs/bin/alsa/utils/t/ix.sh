{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-utils
{% endblock %}

{% block version %}
1.2.15.1
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/utils/alsa-utils-{{self.version().strip()}}.tar.bz2
5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327
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
