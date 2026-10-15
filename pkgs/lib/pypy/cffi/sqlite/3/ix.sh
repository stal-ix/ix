{% extends '//lib/pypy/cffi/t/ix.sh' %}

{% include '//lib/pypy/cffi/sqlite/3/mod.sh' %}

{# lib_deps, not bld_libs: whoever links this archive needs the
   library on the same line, and bld_libs stop here #}
{% block lib_deps %}
lib/sqlite/3
{% endblock %}

{% block patch %}
{# The build script works out what this sqlite supports by dlopening it
   and looking for symbols. There is nothing to dlopen in a static
   build, and the answers are known: a statically linked sqlite has no
   loadable extensions, and every sqlite since 3.6.11 has the backup
   API and every one since 3.7.14 has close_v2. #}
IX_SQLITE_H=$(echo '#include <sqlite3.h>' | cc -E -x c - \
    | sed -n 's|^# [0-9]* "\(.*sqlite3\.h\)".*|\1|p' | head -1)
IX_SQLITE_VER=$(sed -n 's|^#define SQLITE_VERSION_NUMBER  *||p' "${IX_SQLITE_H}")
echo "sqlite header ${IX_SQLITE_H} is version ${IX_SQLITE_VER}"

sed -e 's|^    unverified_lib = unverified_ffi.dlopen(libname)|    return False|' \
    -e 's|^def _has_backup():|def _has_backup():\n    return True|' \
    -e "s|^def _get_version():|def _get_version():\n    return ${IX_SQLITE_VER}|" \
    -i lib_pypy/_sqlite3_build.py
grep -n -A2 'def _has_load_extension\|def _has_backup\|def _get_version' lib_pypy/_sqlite3_build.py
{% endblock %}
