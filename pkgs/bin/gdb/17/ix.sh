{% extends '//bin/gdb/t/ix.sh' %}

{% block pkg_name %}
gdb
{% endblock %}

{% block version %}
17.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-{{self.version().strip()}}.tar.xz
14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876
{% endblock %}

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
    if (name && strlen(name) > 4 && current_demangling_style != -1) {
        int status = 0;

        if (auto res = __cxa_demangle(name, nullptr, nullptr, &status); res) {
            gdb::unique_xmalloc_ptr<char> r;
            r.reset(res);
            return r;
        }
    }

    return gdb_demangle_xxx(name, options);
}
EOF

# fix (?) some braindamage
sed -e 's/asm_demangle,/demangle || asm_demangle,/' -i gdb/printcmd.c
{% endblock %}

{% block cpp_defines %}
{{super()}}
c_ospeed=__c_ospeed
c_ispeed=__c_ispeed
{% endblock %}
