#!/usr/bin/env sh
# usage: gen.sh <wine tree> <work dir> <threads>
# Compresses the PE dlls and data of an installed Wine tree, one zstd
# frame per file, and writes <work dir>/payload.S, the table embed.c reads.

set -eu

tree=${1}
work=${2}
thrs=${3}

mkdir -p ${work}/z
cd ${tree}

# import libraries (*.a) only matter for building against Wine
find wine share/wine -type f ! -name '*.a' | LC_ALL=C sort | awk '{print NR - 1, $0}' > ${work}/index

awk -v z=${work}/z '{print $2, z "/" $1 ".zst"}' ${work}/index \
    | xargs -P ${thrs} -n 2 sh -c 'zstd -q -19 -f "${0}" -o "${1}"'

# changes with the contents, see wine_embed_mtime in embed.c
mtime=$((1500000000 + 0x$(cat $(awk -v z=${work}/z '{print z "/" $1 ".zst"}' ${work}/index) | sha256sum | cut -c1-7)))

(
    echo '    .section .rodata.wine_embed_names,"a"'
    while read n f; do
        echo "n${n}: .asciz \"$(echo ${f} | sed -e 's|^wine/|lib/wine/|')\""
    done < ${work}/index

    echo '    .section .wine_embed,"a"'
    while read n f; do
        echo "d${n}: .incbin \"${work}/z/${n}.zst\""
        echo "e${n}:"
    done < ${work}/index

    echo '    .section .data.rel.ro.wine_embed,"aw"'
    echo '    .p2align 3'
    echo '    .globl wine_embed_files'
    echo 'wine_embed_files:'
    while read n f; do
        echo "    .quad n${n}, d${n}, e${n} - d${n}, $(wc -c < ${f})"
    done < ${work}/index
    echo '    .globl wine_embed_count'
    echo 'wine_embed_count:'
    echo "    .quad $(wc -l < ${work}/index)"
    echo '    .globl wine_embed_mtime'
    echo 'wine_embed_mtime:'
    echo "    .quad ${mtime}"

    echo '    .section .note.GNU-stack,"",@progbits'
) > ${work}/payload.S
