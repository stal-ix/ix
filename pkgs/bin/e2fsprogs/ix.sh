{% extends '//lib/e2fsprogs/ix.sh' %}

{% block configure_flags %}
{{super()}}
--sysconfdir=${out}/share/e2fs
--enable-symlink-install
--enable-relative-symlinks
{% endblock %}
