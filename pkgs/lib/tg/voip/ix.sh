{% extends '//die/c/cmake.sh' %}

{% block fetch %}
{% include '//bin/telegram/desktop/unwrap/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/alsa
lib/opus
lib/tg/owt
lib/shim/fake/pkg(pkg_name=tgvoip,pkg_ver=2.4.4)
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block unpack %}
{{super()}}
export TPL=${PWD}/Telegram/ThirdParty
export LTV=${TPL}/libtgvoip
cp -R cmake/* ${LTV}/cmake
cp -R Telegram/cmake/* ${LTV}/cmake/
cp -R Telegram/cmake/* ${LTV}/
cd ${LTV}
cat cmake/target_* >> cmake/init_target.cmake
>cmake/options_linux.cmake
{% endblock %}

{% block patch %}
sed -e 's|typeof|__typeof__|' -i ${TPL}/libtgvoip/os/linux/AudioInputALSA.cpp
sed -e 's|typeof|__typeof__|' -i ${TPL}/libtgvoip/os/linux/AudioOutputALSA.cpp
{% endblock %}

{% block install %}
{{super()}}
# broken
rm -rf ${out}/lib/pkgconfig
{% endblock %}

{% block cmake_flags %}
LIBTGVOIP_DISABLE_PULSEAUDIO=ON
third_party_loc=${TPL}
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/tgvoip \${CPPFLAGS}"
{% endblock %}
