{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/elfmz/far2l/archive/refs/tags/v_2.6.5.tar.gz
sha:0e68efff1c5d950c86cdad0387bf1aae7b152dbdd7d24b70bbefeeb4f873a9c9
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
bld/dlfcn
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
{% endblock %}
