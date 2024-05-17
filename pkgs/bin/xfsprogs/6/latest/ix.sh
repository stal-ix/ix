{% extends '//bin/xfsprogs/t/ix.sh' %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.8.0.tar.xz
sha:78b6ab776eebe5ab52e0884a70fa1b3633e64a282b1ecfae91f5dd1d9ec5f07d
{% endblock %}
