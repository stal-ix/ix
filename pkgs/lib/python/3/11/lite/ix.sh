{% extends '//lib/python/3/11/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
{% endblock %}

{% block ensure_static_build %}
{{super()}}
cat Modules/Setup.local \
    | grep -v _bz2      \
    | grep -v _dbm      \
    | grep -v _gdbm     \
    | grep -v _lzma     \
    | grep -v readline  \
    | grep -v _ssl      \
    | grep -v _curses   \
    | grep -v expat     \
    | grep -v _decimal  \
    | grep -v _sqlite   \
    | grep -v _hashopenssl > _
mv _ Modules/Setup.local
{% endblock %}
