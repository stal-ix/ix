{% extends '//bin/xfsprogs/t/ix.sh' %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.5.0.tar.xz
sha:8db81712b32756b97d89dd9a681ac5e325bbb75e585382cd4863fab7f9d021c6
{% endblock %}
