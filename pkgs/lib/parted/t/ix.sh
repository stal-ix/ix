{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
parted
{% endblock %}

{% block version %}
3.8
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/parted/parted-{{self.version().strip()}}.tar.xz
a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63
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

{% block autoreconf %}
sed -e 's/AM_GNU_GETTEXT_VERSION(\[0.18\])/AM_GNU_GETTEXT_VERSION([0.25.1])/' -i configure.ac
{{super()}}
{% endblock %}
