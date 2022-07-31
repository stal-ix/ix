{% extends '//bin/wayfire/stock/ix.sh' %}

{% block patch %}
base64 -d << EOF > src/api/wayfire/option-wrapper.hpp
{% include 'opts.h/base64' %}
EOF

sed -e 's|plugin_name.at.*|true)|' -i src/output/plugin-loader.cpp
{% endblock %}

{% block build %}
{{super()}}

cd ${tmp}

llvm-nm --no-demangle --print-file-name -j $(find . -name '*.o') | grep newInstance | while read l; do
    p=$(echo ${l} | sed -e 's|:.*||')
    f=$(basename ${p})
    n=$(echo ${f} | sed -e 's|.cpp.o||' | tr '-' '_')

    llvm-objcopy --preserve-dates \
        --redefine-sym "newInstance=newInstance_${n}"             \
        --redefine-sym "getWayfireVersion=getWayfireVersion_${n}" \
        ${p}
done

llvm-nm --no-demangle --print-file-name -j $(find . -name '*.o') | grep newInstance | while read l; do
    n=$(echo ${l} | sed -e 's|.*newInstance_||')
    s=$(echo ${n} | tr '_' '-')

    echo "${s} newInstance newInstance_${n}"
    echo "${s} getWayfireVersion getWayfireVersion_${n}"
done | dl_stubs > stub.c

cc -o real_wayfire stub.c $(find ${tmp} -type f -name '*.o')
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/real_wayfire ${out}/bin/wayfire
{% endblock %}
