{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
parted
{% endblock %}

{% block version %}
3.7
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/parted/parted-{{self.version().strip()}}.tar.xz
008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b
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
