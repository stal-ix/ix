{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/zstd
lib/dlfcn
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/python/14
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-build-python=${NATIVE_PYTHON}
{% if py_no_gil %}
--without-gil
{% endif %}
{% if py_jit %}
--enable-experimental-jit
{% endif %}
{% endblock %}

{% block patch %}
sed -e 's|MACHDEP=.*unknown.*|:|' \
    -e 's|.*ERROR.*cross build not.*||' \
    -i configure.ac
sed -e 's|= 19|= '${CLANG_VERSION}'|' \
    -i Tools/jit/_llvm.py
{{super()}}
{% endblock %}

{% block ensure_static_build %}
{{super()}}
sed -e 's|.*_zstd.*|_zstd _zstd/_zstdmodule.c _zstd/zstddict.c _zstd/compressor.c _zstd/decompressor.c|' \
    -i Modules/Setup.local
{% endblock %}

{% block configure %}
export READELF=llvm-readelf
export MACHDEP={{target.os}}
export ac_sys_system={{target.cmake_system_name}}
export ac_sys_release=
export ac_md_system=${ac_sys_system}
export ac_md_release=${ac_sys_release}
export ac_cv_file__dev_ptc=no
export ac_cv_file__dev_ptmx=yes
{{super()}}
{% endblock %}
