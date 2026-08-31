{% extends '//die/python/freeze.sh' %}

{% block pkg_name %}
blueprint-compiler
{% endblock %}

{% block version %}
0.22.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/blueprint-compiler/archive/refs/tags/v{{self.version().strip()}}.tar.gz
39a6eab0c88ca08c835ecbfde25f1b34190b62620e1e95ca75bcb65fde5ec090
{% endblock %}

{% block std_env %}
bld/make
bld/python/13
bld/pip/scripts
bld/gir
{{super()}}
{% endblock %}

{% block run_deps %}
bld/gir
{% endblock %}

{% block bld_libs %}
bld/py/gobject
{% endblock %}

{% block bld_data %}
lib/glib/gir
lib/gi/repository/gir
{% endblock %}

{% block step_patch %}
cat << EOF > blueprint_compiler
from blueprintcompiler import main
main.main()
EOF

cat << EOF > blueprintcompiler/config.py
VERSION = "{{self.version().strip()}}"
DATADIR = ""
EOF
{% endblock %}

{% block more_modules %}
py_exports
{% endblock %}

{% block entry_point %}blueprint_compiler{% endblock %}

{% block build %}
export PYTHONHOME=${TARGET_PYTHONHOME}
export PYTHONPLATLIBDIR=${PYTHONHOME}/lib
python3 ${PYTHONPLATLIBDIR}/aux/freeze/freeze.py -m {{self.entry_point()}} $(cat modules)
cp $(find ${PYTHONPLATLIBDIR} -name config.c) ./
make -j ${make_thrs}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp {{self.entry_point()}}.bin ${out}/bin/blueprint-compiler-bin

cat << EOF > ${out}/bin/blueprint-compiler
#!/usr/bin/env sh
set -eu

if test -n "\${GIRPATH:-}"; then
    # IX metadata packages contain GIR files but may omit typelibs.
    blueprint_typelib_dir=\${TMPDIR:-/tmp}/blueprint-typelibs
    mkdir -p \${blueprint_typelib_dir}
    blueprint_old_ifs=\${IFS}
    IFS=:
    for blueprint_gir_path in \${GIRPATH}; do
        blueprint_typelib_path=\${blueprint_gir_path%/gir-1.0}/girepository-1.0
        GI_TYPELIB_PATH=\${GI_TYPELIB_PATH:+\${GI_TYPELIB_PATH}:}\${blueprint_typelib_path}
        for blueprint_gir_file in \${blueprint_gir_path}/*.gir; do
            test -f \${blueprint_gir_file} || continue
            ln -sf \${blueprint_gir_file} \${blueprint_typelib_dir}/\${blueprint_gir_file##*/}
        done
    done
    IFS=\${blueprint_old_ifs}

    for blueprint_gir_file in \${blueprint_typelib_dir}/*.gir; do
        test -f \${blueprint_gir_file} || continue
        blueprint_typelib=\${blueprint_gir_file%.gir}.typelib
        test -f \${blueprint_typelib} || g-ir-compiler \
            --includedir=\${blueprint_typelib_dir} \
            -o \${blueprint_typelib} \${blueprint_gir_file}
    done

    GI_TYPELIB_PATH=\${blueprint_typelib_dir}:\${GI_TYPELIB_PATH}
    export GI_TYPELIB_PATH
fi

exec ${out}/bin/blueprint-compiler-bin "\${@}"
EOF
chmod +x ${out}/bin/blueprint-compiler
{% endblock %}

{% block postinstall %}
${out}/bin/blueprint-compiler --version
{% endblock %}
