{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/parted/parted-3.4.tar.xz
sha:e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/readline
bin/util/linux
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block configure_flags %}
--disable-device-mapper
{% endblock %}
