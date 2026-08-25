{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-utils
{% endblock %}

{% block version %}
1.2.16
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/utils/alsa-utils-{{self.version().strip()}}.tar.bz2
092399d5e8749a1d5e188e393157521cec4b75693b60ebb79bbce728cff2232c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block conf_ver %}2/72{% endblock %}

{% block configure_flags %}
--with-udev-rules-dir="${out}/share"
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% block patch %}
sed -e 's|install-data-hook|xxx|' -i Makefile.am
sed -e 's|if (err)$|if (errcode)|' -e 's|snd_strerror(err))|snd_strerror(errcode))|' -i seq/aconnect/aconnect.c
{% endblock %}

{% block cpp_defines %}
u_int8_t=uint8_t
u_int16_t=uint16_t
u_int32_t=uint32_t
u_int64_t=uint64_t
{% endblock %}
