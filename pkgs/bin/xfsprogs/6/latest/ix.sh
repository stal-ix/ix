{% extends '//bin/xfsprogs/t/ix.sh' %}

{% block pkg_name %}
xfsprogs
{% endblock %}

{% block version %}
6.17.0
{% endblock %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-{{self.version().strip()}}.tar.xz
5b0f56a81f641326266f762ae8a563b29d95cdbcda83bc7938f68ce122f1edd9
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
