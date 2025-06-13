{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
parted
{% endblock %}

{% block version %}
3.6
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/parted/parted-{{self.version().strip()}}.tar.xz
3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612
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
