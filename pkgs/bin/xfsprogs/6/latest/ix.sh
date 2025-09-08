{% extends '//bin/xfsprogs/t/ix.sh' %}

{% block pkg_name %}
xfsprogs
{% endblock %}

{% block version %}
6.16.0
{% endblock %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-{{self.version().strip()}}.tar.xz
fa7ba8c35cb988e7d65b7e7630fe9d0e17e8d79799d3b98db7e19f2b9b150506
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
