{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/elfmz/far2l/archive/920f22abae00f9f7d0592d3d21f78dc82a0c2f3a.tar.gz
sha:97b436175b513318104605fefbf5f343325feb0b9bdd312aef6a86de9096a4cb
{% endblock %}

{% block bld_libs %}
lib/c
lib/fmt
lib/ssh
lib/pcre
lib/magic
lib/spdlog
lib/archive
lib/xerces/c
lib/uchardet
lib/execinfo/fake
{% if linux %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/m4
bld/pkg/config
bld/scripts/dlfcn
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

{% block patch %}
cat << EOF | dl_stubs >> far2l/src/init.c
c GetPathTranslationPrefix GetPathTranslationPrefix
c GetPathTranslationPrefixA GetPathTranslationPrefixA
EOF

find . -type f | while read l; do
    sed -e 's|src/main.cpp|src/main.cpp src/init.c|' -i ${l}
done
{% endblock %}
