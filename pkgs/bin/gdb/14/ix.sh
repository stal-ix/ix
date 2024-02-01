{% extends '//bin/gdb/t/ix.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's| = { 0 }|; memset(tpidrs, 0, sizeof(tpidrs))|' \
    -i gdb/aarch64-linux-nat.c

# use llvm demangler
sed -e 's|.*gdb_demangle.*int options.*|static gdb_demangle_xxx(const char* name, int options)|' -i gdb/cp-support.c
cat << EOF >> gdb/cp-support.c
extern "C" char* __cxa_demangle(const char* mangled_name, char* output_buffer, size_t* length, int* status);

gdb::unique_xmalloc_ptr<char> gdb_demangle(const char* name, int options) {
    int status = 0;

    if (auto res = __cxa_demangle(name, nullptr, nullptr, &status); res) {
        gdb::unique_xmalloc_ptr<char> r;
        r.reset(res);
        return r;
    }

    return gdb_demangle_xxx(name, options);
}
EOF
{% endblock %}
