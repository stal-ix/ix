{% extends '//bin/xfsprogs/t/ix.sh' %}

{# grub can't see it :( #}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.9.0.tar.xz
sha:975284783fb3fbc4e1ae640bd804d788e4237a86b07582acee86b6e48f6521b7
{% endblock %}
