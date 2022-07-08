{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/efibootmgr
bin/grub/efi/unwrap
{% endblock %}
