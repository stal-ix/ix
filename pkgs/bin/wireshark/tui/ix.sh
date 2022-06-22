{% extends '//bin/wireshark/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_wireshark=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s dumpcap dumpcap-lib
{% endblock %}
