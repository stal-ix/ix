{% extends '//mix/template/cmake.sh' %}

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
{% if target.os == 'linux' %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/m4
bin/pkg-config
{% endblock %}

{% block patch %}
find . | grep CMakeLists.txt | while read l; do
    sed -e 's| MODULE | STATIC |' -i ${l}
done
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

{% block setup %}
export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
{% endblock %}

{% block cmake_flags %}
USEWX=no
{% endblock %}
