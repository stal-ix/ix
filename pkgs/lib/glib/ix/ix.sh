{% extends '//lib/glib/pure/ix.sh' %}

{% block lib_deps %}
lib/mimetype
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/kernel
{{super()}}
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include '0.diff' %}
EOF

patch -p1 << EOF
{% include '1.diff' %}
EOF

cat << EOF >> _
void gobject_init(void);
EOF

cat gobject/gtype.c | sed -e 's|gobject_init (void)|gobject_init_xxx (void)|' >> _

cat << EOF >> _
static int ginitdone;

void gobject_init(void) {
    if (!ginitdone) {
        ginitdone = 1;
        gobject_init_xxx();
    }
}
EOF

mv _ gobject/gtype.c

sed -e 's|.*fast && result_.*||' \
    -e 's|sniff_length = _.*|sniff_length = 1024;| ' \
    -i gio/glocalfileinfo.c

cat << EOF >> glib/gstrfuncs.h
#undef g_strdup
#undef g_str_has_suffix
#undef g_str_has_prefix
EOF

{{super()}}
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/gio-unix-2.0 \${CPPFLAGS}"
{% endblock %}
