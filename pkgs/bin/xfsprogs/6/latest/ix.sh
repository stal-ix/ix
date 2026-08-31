{% extends '//bin/xfsprogs/t/ix.sh' %}

{% block pkg_name %}
xfsprogs
{% endblock %}

{% block version %}
7.1.1
{% endblock %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-{{self.version().strip()}}.tar.xz
063edc31ba8e85c95c7faf9be465a04898bba7c6e622fdd9b146eed4ca5415e8
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/attr
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
hist_init
{% endblock %}

{% block cpp_defines %}
{{super()}}
OVERRIDE_SYSTEM_STATX=1
STATX__RESERVED=0x80000000U
{% endblock %}
