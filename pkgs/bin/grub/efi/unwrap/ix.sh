{% extends '//bin/grub/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-platform=efi
--disable-efiemu
{% endblock %}
