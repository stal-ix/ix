{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/grub/efi
bin/efibootmgr
bin/parted
bin/dosfstools
{% endblock %}
