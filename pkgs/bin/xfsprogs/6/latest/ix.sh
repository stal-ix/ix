{% extends '//bin/xfsprogs/t/ix.sh' %}

{% block pkg_name %}
xfsprogs
{% endblock %}

{% block version %}
7.3.0
{% endblock %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-{{self.version().strip()}}.tar.xz
310c11e9e1d336064921cc123de5c84a331d5abe3c3b82aeadb89a191d34b449
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
