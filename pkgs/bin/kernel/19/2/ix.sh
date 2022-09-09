{% extends '//bin/kernel/19/t/ix.sh' %}

{% block slot %}2{% endblock %}

{% block firmware %}
{{super()}}
rtw88/rtw8822b_fw.bin
{% endblock %}

{% block kernel_flags %}
{% include 'cfg' %}
{% endblock %}
