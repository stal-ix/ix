{% extends '//bin/wine/t/ix.sh' %}

{# First pass: the whole Wine build, kept as what bin/wine links and ships.

   lib/libwine_<m>.a for every unixlib. Leaf modules are only ever reached
   through dlopen/dlsym, so all their symbols get the <m>_ prefix and
   bin/wine/modules/dl registers them back under the plain names. ntdll and
   win32u stay as they are: the other unixlibs link against them directly
   (-lntdll for all, -lwin32u for the display/GL/Vulkan ones).

   lib/libwineserver.a is the server, every symbol prefixed with
   wineserver_ (main becomes wineserver_main).

   lib/wine-tree keeps the rest of the install, the PE dlls and data
   bin/wine/payload embeds; WINE_TREE points there. #}

{% block bld_tool %}
{{super()}}
bld/librarian
{% endblock %}

{% block install %}
{{super()}}
for so in ${out}/lib/wine/x86_64-unix/*.so; do
    m=$(basename ${so} .so)
    cp ${so} ${out}/lib/libwine_${m}.a
    case ${m} in
        ntdll|win32u)
            ;;
        *)
            patchns ${out}/lib/libwine_${m}.a ${m}_
            ;;
    esac
done
# the server goes into the same executable, run when called as wineserver;
# libwineserver.a stays out of the libwine_* set bin/wine/modules/dl registers
llvm-ar qc ${out}/lib/libwineserver.a server/*.o
patchns ${out}/lib/libwineserver.a wineserver_
# ntdll and win32u each keep a few private helpers under the same name;
# separate libraries in ELF, one link here, so win32u's copies move aside
cd ${out}/lib
for m in ntdll win32u; do
    llvm-nm --defined-only --extern-only libwine_${m}.a | awk 'NF == 3 {print $3}' | sort -u > ${tmp}/${m}.syms
done
comm -12 ${tmp}/ntdll.syms ${tmp}/win32u.syms | sed -e 's|.*|& win32u_&|' > ${tmp}/clash
cat ${tmp}/clash
llvm-objcopy --redefine-syms=${tmp}/clash libwine_win32u.a
rm -rf ${out}/lib/wine/x86_64-unix ${out}/include
mkdir ${out}/lib/wine-tree
mv ${out}/bin ${out}/share ${out}/lib/wine ${out}/lib/wine-tree/
{% endblock %}

{% block env %}
export WINE_TREE=${out}/lib/wine-tree
export WINE_MODULES=${out}/lib
{% endblock %}
