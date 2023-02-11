{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/parted
bin/grub/efi
bin/efibootmgr
bin/dosfstools
{% endblock %}
