{% extends '//die/c/ix.sh' %}

{# The PE dlls and data of bin/wine/modules, embedded into the standalone
   bin/wine: payload.o carries one zstd frame per file in a segment of its
   own, high above the 32-bit address space (embed.ld), embed.o serves them
   to the patched Wine through the wine_embed_* functions.

   Only the final link of the wine loader takes these, through WINE_EMBED:
   linking them everywhere would drag 100+ MB into every configure test. #}

{% block bld_libs %}
lib/c
lib/zstd
bin/wine/modules
{% endblock %}

{% block bld_tool %}
bld/zstd
{% endblock %}

{% block step_unpack %}
: nothing to unpack
{% endblock %}

{% block build %}
base64 -d << EOF > embed.c
{% include 'embed.c/base64' %}
EOF
base64 -d << EOF > gen.sh
{% include 'gen.sh/base64' %}
EOF
sh gen.sh ${WINE_TREE} ${PWD}/work ${make_thrs}
cc -c -o embed.o embed.c
cc -c -o payload.o work/payload.S
{% endblock %}

{% block install %}
mkdir -p ${out}/lib/wine-embed
cp embed.o payload.o ${out}/lib/wine-embed/
cat << EOF > ${out}/lib/wine-embed/embed.ld
SECTIONS { .wine_embed 0x7d0000000000 : { KEEP(*(.wine_embed)) } } INSERT AFTER .bss;
EOF
{% endblock %}

{% block env %}
export WINE_EMBED="-Wl,-T,${out}/lib/wine-embed/embed.ld ${out}/lib/wine-embed/embed.o ${out}/lib/wine-embed/payload.o"
{% endblock %}
