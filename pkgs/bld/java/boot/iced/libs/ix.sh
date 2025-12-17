{% extends '//bld/java/boot/iced/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/gif
lib/c++
lib/png
lib/jpeg
lib/alsa
lib/kernel
lib/lcms/2
lib/freetype
aux/x11/proto
lib/shim/iced
lib/shim/fake(lib_name=cups)
lib/shim/fake/symbol(symbol_name=cupsServer)
lib/shim/fake/header(header=cups/cups.h)
lib/shim/fake/header(header=cups/ppd.h)
lib/shim/fake/pkg(pkg_name=xt,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=x11,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xtst,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xrender,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xinerama,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xcomposite,pkg_ver=100500)
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
cp openjdk.build-boot/tmp/java/fdlibm/obj64/libfdlibm.amd64.a ${out}/lib/
rm ${out}/lib/libsaproc.a
llvm-ar qL ${out}/lib/libjsig.a openjdk.build-boot/lib/amd64/libjsig.so
find ${out} -type f -name '*.a' | while read l; do
    llvm-objcopy \
        --redefine-sym=signal=jdk_signal \
        --redefine-sym=sigset=jdk_sigset \
        --redefine-sym=sigaction=jdk_sigaction \
        ${l}
done
{% endblock %}

{% block c_rename_symbol %}
scalbn
copysign
{% endblock %}
