{% extends '//bin/kernel/t/0/ix.sh' %}

{% block bld_libs %}
lib/firmware
{{super()}}
{% endblock %}

{# (find amdgpu/ rtw88/ i915/ mediatek/ rtl_nic/ -type f; ls iwlwifi-cc-a0-*) > fw.sh #}

{% block firmware %}
{% include 'fw.sh' %}
regulatory.db
regulatory.bin
regulatory.db.p7s
{% endblock %}

{% block kconfig_flags %}
CONFIG_EXTRA_FIRMWARE="{{ix.fix_list(self.firmware())}}"
CONFIG_EXTRA_FIRMWARE_DIR="${LINUX_FIRMWARE}"
{% endblock %}
