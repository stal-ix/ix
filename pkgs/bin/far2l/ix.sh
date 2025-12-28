{% extends '//die/c/cmake.sh' %}

{% block version %}
2.7.0
{% endblock %}

{% block pkg_name %}
far2l
{% endblock %}

{% block fetch %}
https://github.com/elfmz/far2l/archive/refs/tags/v_{{self.version().strip()}}.tar.gz
712ab8e5b40482ddd68e33f870e4c3d7e8f8c44b90fb9fe91288a00cb27dff48
{% endblock %}

{% block bld_libs %}
lib/c
lib/fmt
lib/ssh
lib/pcre
lib/magic
lib/xml/2
lib/spdlog
lib/kernel
lib/archive
lib/xerces/c
lib/uchardet
lib/execinfo/fake
{% endblock %}

{% block bld_tool %}
bld/m4
bld/perl
bld/pkg/config
{% endblock %}

{% block c_rename_symbol %}
Ppmd8_Free
Ppmd8_Init
Ppmd8_Alloc
Ppmd8_Update2
Ppmd8_Update1
Ppmd8_Update1_0
Ppmd8_Construct
Ppmd8_UpdateBin
PPMD8_kExpEscape
Ppmd8_MakeEscFreq
Ppmd8_DecodeSymbol
Ppmd8_RangeDec_Init
{% endblock %}

{% block cmake_flags %}
USEWX=no
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block patch %}
sed -e 's|.*if.*dlinfo.*|{|' \
    -i arclite/src/Patch7zCP.cpp
{% endblock %}
