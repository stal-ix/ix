{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/parted/parted-3.5.tar.xz
sha:4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block lib_deps %}
lib/c
lib/linux/util
lib/device/mapper
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
