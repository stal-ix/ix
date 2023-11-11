{% extends '//bin/p7zip/t/ix.sh' %}

{% block bld_tool %}
bld/gzip
bld/dlfcn
bld/librarian
{% endblock %}

{% block make_flags %}
{{super()}}
DEST_HOME=${out}
DEST_BIN=${out}/lib
DEST_LIB=${out}/bin
DEST_SHARE=${out}/lib
DEST_MAN=${out}/doc
DEST_SHARE_DOC=${out}/doc
{% endblock %}

{% block make_target %}
7z
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block build %}
{{super()}}
for x in global_use_utf16_conversion global_use_lstat sync_TestConstructor CreateObject CreateDecoder CreateEncoder GetMethodProperty GetHashers GetHandlerProperty2 GetIsArc GetNumberOfMethods GetNumberOfFormats GetHandlerProperty; do
    echo "7z ${x} so_7z_{{target.symbol_prefix}}${x}"
done | dl_stubs > stubs.cpp
mv bin/7z.so 7z.a
patchns 7z.a {{target.symbol_prefix}}so_7z_
{% if darwin %}
c++ -o real7z stubs.cpp CPP/7zip/UI/Console/*.o -Wl,-all_load 7z.a
{% else %}
c++ -o real7z stubs.cpp CPP/7zip/UI/Console/*.o -Wl,--whole-archive 7z.a -Wl,--no-whole-archive
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
mkdir ${out}/bin
cp real7z ${out}/bin/7z
{% endblock %}

{% block cpp_missing %}
stdint.h
{{super()}}
{% endblock %}

{% block cpp_defines %}
_UINT64_T_DECLARED
{{super()}}
{% endblock %}
