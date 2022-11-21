{% extends '//bin/wireshark/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
lib/{{allocator}}/trim(delay=3,bytes=30000000)
{% endblock %}

{% block cmake_flags %}
{{super()}}
USE_qt6=ON

BUILD_wireshark=ON

BUILD_dumpcap=OFF
BUILD_logwolf=OFF
BUILD_tshark=OFF
BUILD_tfshark=OFF
BUILD_rawshark=OFF
BUILD_text2pcap=OFF
BUILD_mergecap=OFF
BUILD_reordercap=OFF
BUILD_editcap=OFF
BUILD_capinfos=OFF
BUILD_captype=OFF
BUILD_randpkt=OFF
BUILD_dftest=OFF
BUILD_corbaidl2wrs=OFF
BUILD_dcerpcidl2wrs=OFF
BUILD_xxx2deb=OFF
BUILD_androiddump=OFF
BUILD_sshdump=OFF
BUILD_ciscodump=OFF
BUILD_dpauxmon=OFF
BUILD_randpktdump=OFF
BUILD_wifidump=OFF
BUILD_etwdump=OFF
BUILD_etwdump=OFF
BUILD_sdjournal=OFF
BUILD_sdjournal=OFF
BUILD_udpdump=OFF
BUILD_sharkd=OFF
BUILD_mmdbresolve=OFF
BUILD_fuzzshark=OFF
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin

# redirect dumpcap to tui package
cat << EOF > dumpcap
#!/usr/bin/env sh
exec dumpcap-lib "\${@}"
EOF

chmod +x dumpcap
{% endblock %}
