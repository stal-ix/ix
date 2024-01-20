{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://www.agner.org/optimize/asmlib.zip
sha:481d6245051a2b82c06e393b782ba1dd1fe9724209ed9ba5ad5692728ef8da7a
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract0 ${src}/*zip
mkdir src; cd src
extract0 ../asmlibSrc.zip
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|?OVR_||g' -e 's|asm/||g' -i ${l}
done
{% endblock %}

{% block build %}
(
cat << EOF
memset64.asm
debugbreak64.asm
cachesize64.asm
divfixedi64.asm
rdtsc64.asm
strcat64.asm
unalignedisfaster64.asm
strcpy64.asm
substring64.asm
strlen64.asm
cputype64.asm
memcmp64.asm
memmove64.asm
stricmp64.asm
divfixedv64.asm
physseed64.asm
cpuid64.asm
round64.asm
memcpy64.asm
popcount64.asm
dispatchpatch64.asm
EOF
) | while read l; do
    nasm -felf64 -DUNIX -o ${l}.o ${l}
done

ar q libasmlib.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}
