{% extends '//die/c/c_std.sh' %}

{% block fetch %}
https://www.agner.org/optimize/asmlib.zip
sha:b5af07ce1a094b6163be0ffcdd140ee54b7c86e364ca4d67d9e391b1d6dc49a8
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 0 ${src}/*zip
mkdir src; cd src
extract 0 ../asmlibSrc.zip
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|?OVR_||g' -e 's|asm/||g' -i ${l}
done
{% endblock %}
                                                                                                                                                                             memset64.asm
{% block build %}
(
cat << EOF
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
