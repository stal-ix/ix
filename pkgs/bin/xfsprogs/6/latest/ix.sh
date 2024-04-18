{% extends '//bin/xfsprogs/t/ix.sh' %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.7.0.tar.xz
sha:e75d1e012853e11597411cfcb80e26c811881cf0ca03715e852b42946cc61e1f
{% endblock %}
