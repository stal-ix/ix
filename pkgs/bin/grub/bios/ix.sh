{% extends '//bin/grub/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--target=i386
--with-platform=pc
--enable-efiemu
{% endblock %}

{% block configure %}
sed -e 's|falign-jumps|Dxxxxxx|' -i configure
{{super()}}
{% endblock %}
