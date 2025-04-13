{% extends '//bin/xfsprogs/t/ix.sh' %}

{% block version %}
6.13.0
{% endblock %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-{{self.version().strip()}}.tar.xz
sha:0459933f93d94c82bc2789e7bd63742273d9d74207cdae67dc3032038da08337
{% endblock %}

{% block bld_libs %}
lib/linux/headers/prev
{{super()}}
lib/attr
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
hist_init
{% endblock %}
