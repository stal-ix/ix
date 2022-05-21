{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/parted/parted-3.5.tar.xz
sha:4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/readline
# TODO(pg): proper lib
bin/util/linux
lib/device/mapper
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
