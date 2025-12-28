{% extends '//bld/java/8/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/gif
lib/c++
lib/png
lib/jpeg
lib/cups
lib/alsa
lib/kernel
lib/lcms/2
lib/freetype
lib/shim/iced
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
cp build/linux-x86_64-normal-server-release/jdk/objs/libfdlibm.a ${out}/lib/
find ${tmp} | grep libjsig
exit 1
rm ${out}/lib/libsaproc.a
{% endblock %}

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
scalbn
{% endblock %}
