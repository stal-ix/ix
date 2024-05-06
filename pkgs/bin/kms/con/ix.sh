{% extends 'stock/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/dlfcn
{% endblock %}

{% block postinstall %}
cd ${tmp}/obj/src
ls mod*.a | while read l; do
    mn=$(echo ${l} | sed -e 's|mod-||' | sed -e 's|\.a||')
    llvm-objcopy --redefine-sym=module=${mn}_module ${l}
    echo "mod-${mn} module ${mn}_module"
done | dl_stubs > stubs.c
cat stubs.c
cc -o kmscon1 stubs.c $(find kmscon.p -type f -name '*.o') $(find -type f -name '*.a')
cp kmscon1 ${out}/bin/
{% endblock %}
