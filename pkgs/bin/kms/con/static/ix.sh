{% extends '//bin/kms/con/stock/ix.sh' %}

# check bin/kms/con

{% block bld_libs %}
{{super()}}
bin/kms/con/modules
{% for m in self.modules() | parse_list %}
lib/dl/fix(dl_lib=mod-{{m}},dl_symbols=module={{m}}_module)
{% endfor %}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/dlfcn
bld/wrap/cc/plugins/unreg(bins=kmscon)
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|void kmscon_load_modules|void kmscon_load_modules_xxx|' \
    -i src/shl/module.c
cat << EOF >> src/shl/module.c
static void load1(const char* name) {
    struct shl_module* mod;
    mod = 0;
    shl_module_open(&mod, name);
    if (mod && shl_module_load(mod) == 0) {
        dlist_link(&module_list, &mod->list);
    }
}

void kmscon_load_modules(void) {
{% for m in self.modules() | parse_list %}
    load1("mod-{{m}}");
{% endfor %}
}
EOF
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/lib/kmscon
{% endblock %}
