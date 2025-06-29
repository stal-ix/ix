{% extends '//bin/xfsprogs/t/ix.sh' %}

{% block pkg_name %}
xfsprogs
{% endblock %}

{% block version %}
6.15.0
{% endblock %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-{{self.version().strip()}}.tar.xz
13b91f74beef8ad11137f7d9d71055573d91e961bc55bb0245956f69b84cd704
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
