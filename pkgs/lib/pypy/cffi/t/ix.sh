{# One cffi module of PyPy's stdlib, as an archive rather than a .so.

   PyPy imports these through cpyext's create_extension_module, which
   dlopens the file the import system found and looks up
   _cffi_pypyinit_<name> in it. Nothing can load a shared object here,
   so the module is compiled into the interpreter instead: this
   package makes the object code, the /dl package next door puts the
   entry point in the dl table under the name dlopen() will reduce the
   stub file's path to, and bin/pypy links one and installs the other.

   The C comes out of bin/pypy/boot, a pypy built without any of this,
   which is the only way to break the circle. #}

{% extends '//die/c/ix.sh' %}

{% include '//bin/pypy/t/ver.sh' %}

{% block pkg_name %}
pypy-cffi-{{self.cffi_module().strip()}}
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/pypy/boot
bld/librarian
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{# path of the build script, relative to lib_pypy #}
{% block cffi_script %}
{% endblock %}

{# the module name it passes to ffi.set_source() #}
{% block cffi_module %}
{% endblock %}

{% block cpp_includes %}
${PYPY_INCLUDE}
{% endblock %}

{% block build %}
base64 -d << 'IX_EMIT' > lib_pypy/ix_emit.py
{% include 'emit.py/base64' %}
IX_EMIT

pypy{{self.py_ver().strip()}} lib_pypy/ix_emit.py \
    lib_pypy/{{self.cffi_script().strip()}} \
    {{self.cffi_module().strip()}} \
    ${tmp}/{{self.cffi_module().strip()}}

cat ${tmp}/{{self.cffi_module().strip()}}.deps

{# set_source() carries the module's own include dirs and any C it
   vendors alongside the generated file; the harness wrote both out #}
IX_INC=""
IX_OBJS="{{self.cffi_module().strip()}}.o"
IX_N=0

while read IX_KIND IX_PATH; do
    if test "${IX_KIND}" = "INCLUDE"; then
        IX_INC="${IX_INC} -I${IX_PATH}"
    fi
done < ${tmp}/{{self.cffi_module().strip()}}.deps

cc ${IX_INC} -c -o {{self.cffi_module().strip()}}.o \
    ${tmp}/{{self.cffi_module().strip()}}.c

while read IX_KIND IX_PATH; do
    if test "${IX_KIND}" = "SOURCE"; then
        IX_N=$((IX_N + 1))
        cc ${IX_INC} -c -o "ix_vendored_${IX_N}.o" "${IX_PATH}"
        IX_OBJS="${IX_OBJS} ix_vendored_${IX_N}.o"
    fi
done < ${tmp}/{{self.cffi_module().strip()}}.deps

ar q lib{{self.cffi_module().strip()}}.a ${IX_OBJS}

{# Two modules built from one cdef emit the same helper names -- blake2
   is one source with blake2b spelled blake2s, and the accessors cffi
   generates from the shared cdef come out identical -- so everything
   defined here gets the module's name in front of it. The /dl package
   registers the entry point under the name the importer will ask for,
   pointing at the renamed symbol. #}
patchns lib{{self.cffi_module().strip()}}.a {{self.cffi_module().strip()}}_

{# the entry point the importer will look for has to be in there #}
llvm-nm --defined-only --extern-only lib{{self.cffi_module().strip()}}.a \
    | grep {{self.cffi_module().strip()}}__cffi_pypyinit_{{self.cffi_module().strip()}}
{% endblock %}

{% block install %}
mkdir -p ${out}/lib
cp lib{{self.cffi_module().strip()}}.a ${out}/lib/
{% endblock %}
