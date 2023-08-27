{% extends '//bin/weechat/stock/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/dlfcn
bld/librarian
{% endblock %}

{% block install %}
{{super()}}
cd ${tmp}/obj
find . -name '*.so' | while read l; do
    ns=$(basename ${l} | sed -e 's|\..*||')
    cp ${l} ${ns}.a
    patchns ${ns}.a ${ns}_
    llvm-nm ${ns}.a | grep 'weechat_plugin' | sed -e 's|.* ||' | while read l; do
        old=$(echo ${l} | sed -e 's|.*weechat|weechat|')
        echo "${ns} ${old} ${l}"
    done
done | dl_stubs > dl_stubs.c
clang -o ${out}/bin/weechat dl_stubs.c $(find . -name '*.a') $(find . -name 'main.c.o')
{% endblock %}
