{% extends '//bin/xfsprogs/t/ix.sh' %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.10.1.tar.xz
sha:6cb839be1a9535f8352441b3f6eea521ead5c5c7c913e8106cdfac96aa117041
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/attr
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
hist_init
{% endblock %}
