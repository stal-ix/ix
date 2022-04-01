{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/elfmz/far2l/archive/b246b95118c0d7c6d10b4e94ec9b3bc7e24c3a7c.zip
8fb228fd04476f5143163b9cca27366e
{% endblock %}

{% block bld_libs %}
lib/c
lib/fmt
lib/ssh
lib/pcre
lib/magic
lib/spdlog
lib/archive
lib/xerces-c
lib/uchardet
lib/execinfo
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/m4
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

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block cmake_flags %}
USEWX=no
{% endblock %}
