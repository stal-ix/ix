{% extends '//bin/java/17/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/kernel
lib/shim/iced
{% endblock %}

{# First pass: just the native libraries, as archives, for bin/java/17/unwrap
   to register and link into the launchers. Only the registered ones are
   shipped: every archive here is linked everywhere downstream. #}

{% block jdk_targets %}
hotspot libs
{% endblock %}

{# the libraries that keep shared names: the others use the jio_*
   functions of libjvm #}
{% block dl_owner_libs %}
jvm
{% endblock %}

{# one static link holds them all: the entry points the JDK looks up by
   name in each library become <lib>_<name>, registered back under their
   own names by bin/java/17/unwrap; the helpers several libraries define
   for themselves become <lib>_<name> too, in all of them but the owners,
   so each library keeps its own #}
{% block install %}
mkdir ${out}/lib
cd ${out}/lib
{% for l in self.dl_libs() | parse_list %}
cp ${tmp}/lib/lib{{l}}.a .
{% endfor %}
for a in *.a; do
    llvm-nm -g --defined-only ${a} | awk 'NF == 3 && $2 ~ /[TDBR]/ { print $3 }' | sort -u
done | sort | uniq -d | grep -vxE 'JNI_OnLoad|Agent_OnLoad|Agent_OnUnload' > dups || true
for a in *.a; do
    l=$(basename ${a} .a | sed -e 's|^lib||')
    flags=
    for s in JNI_OnLoad Agent_OnLoad Agent_OnUnload; do
        flags="${flags} --redefine-sym=${s}=${l}_${s}"
    done
    case " {{self.dl_owner_libs() | parse_list | join(' ')}} " in
        *" ${l} "*)
            ;;
        *)
            for s in $(llvm-nm -g --defined-only ${a} | awk 'NF == 3 { print $3 }' | grep -Fxf dups); do
                flags="${flags} --redefine-sym=${s}=${l}_${s}"
            done
            ;;
    esac
    llvm-objcopy ${flags} ${a}
done
rm dups
{% endblock %}

{# fdlibm, compiled into libjava, defines these under the libc names #}
{% block c_rename_symbol %}
atanh
copysign
finite
frexp
ilogb
ldexp
logb
modf
nextafter
rint
scalb
scalbn
significand
{% endblock %}
