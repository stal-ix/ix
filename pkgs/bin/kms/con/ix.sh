{% extends 'stock/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/dlfcn
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|void kmscon_load_modules|void kmscon_load_modules_xxx|' \
    -i src/kmscon_module.c
cat << EOF >> src/kmscon_module.c
static void load1(const char* name) {
    struct kmscon_module* mod;
    mod = 0;
    kmscon_module_open(&mod, name);
    if (mod && kmscon_module_load(mod) == 0) {
        shl_dlist_link(&module_list, &mod->list);
    }
}

void kmscon_load_modules(void) {
    load1("mod-bbulk");
    load1("mod-gltex");
    load1("mod-pango");
    load1("mod-pixman");
    load1("mod-unifont");
}
EOF
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
rm -rf ${out}/bin
mkdir ${out}/bin
cp kmscon1 ${out}/bin/kmscon
{% endblock %}
