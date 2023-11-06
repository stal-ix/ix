{% extends '//lib/cffi/xkbcommon/t/ix.sh' %}

{% block lib_deps %}
lib/cffi
lib/xkb/common
{% endblock %}

{% block bld_libs %}
pip/setuptools
{% endblock %}

{% block bld_tool %}
bld/python/{{python_ver}}(py_extra_modules=lib/cffi/module/register,python_ver={{python_ver}})
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block build %}
${NATIVE_PYTHON} xkbcommon/ffi_build.py
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp xkbcommon/_ffi.cpython* ${out}/lib/lib_cffi_xkbcommon.a
llvm-objcopy --redefine-sym PyInit__ffi=PyInit__xkbcommon_ffi ${out}/lib/lib_cffi_xkbcommon.a
{% endblock %}
