{% extends '//lib/trace/event/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's| -D ||' -i plugins/Makefile
{% endblock %}

{% block build %}
cd plugins
for x in *.c; do
    rm -rf *.o
    clang -I../include/traceevent -c ${x}
    llvm-ar q ${x}.a *.o
    mv ${x}.a $(echo ${x} | sed -e 's|\.c|\.so|')
done
for x in *.so; do
    n=$(echo ${x} | sed -e 's|\.so||')
    a=lib${n}.a
    mv ${x} ${a}
    llvm-objcopy \
        --redefine-sym "tep_plugin_loader=tep_plugin_loader_${n}" \
        --redefine-sym "tep_plugin_unloader=tep_plugin_unloader_${n}" \
        ${a}
    echo "${n} tep_plugin_loader tep_plugin_loader_${n}"
    echo "${n} tep_plugin_unloader tep_plugin_unloader_${n}"
done | dl_stubs > stub.c
cc -c -o reg.o stub.c
cd ..
{% endblock %}

{% block install %}
mkdir ${out}/lib
cd plugins
cp reg.o *.a ${out}/lib/
{% endblock %}

{% block env %}
export CTRFLAGS="${out}/lib/reg.o \${CTRFLAGS}"
{% endblock %}
