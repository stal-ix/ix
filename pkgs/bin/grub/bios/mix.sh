{% extends '//bin/grub/t/mix.sh' %}

{% block configure_flags %}
{{super()}}
--target=i386
--with-platform=pc
--enable-efiemu
{% endblock %}
