{% extends '//bin/gthumb/stock/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/dlfcn
bld/librarian
{% endblock %}

{% block build %}
{{super()}}
cd ${tmp}/obj
rm -rf gthumb/test-*
cd extensions
for x in $(ls -A); do (
    cd ${x}
    patchns lib${x}.a ns${x}_
) done
for x in $(ls -A); do
    cat << EOF
${x} gthumb_extension_activate ns${x}_gthumb_extension_activate
${x} gthumb_extension_configure ns${x}_gthumb_extension_configure
${x} gthumb_extension_deactivate ns${x}_gthumb_extension_deactivate
${x} gthumb_extension_is_configurable ns${x}_gthumb_extension_is_configurable
EOF
done | dl_stubs > ../stubs.c
cd ..
cc -o gthumb.exe stubs.c $(find gthumb -type f -name '*.o') $(find extensions -type f -name '*.a')
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/obj/gthumb.exe ${out}/bin/gthumb
{% endblock %}
