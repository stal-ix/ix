{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/telegramdesktop/tdesktop/releases/download/v3.7.2/tdesktop-3.7.2-full.tar.gz
sha:46ee1e533b36eb785e23983ab9771297d1eeec61d1ba926c7baa35bb158ff083
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/alsa
lib/opus
lib/tg/owt
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
>cmake/options_linux.cmake
{% endblock %}

{% block cmake_flags %}
LIBTGVOIP_DISABLE_PULSEAUDIO=ON
third_party_loc=${TPL}
{% endblock %}

{% block install %}
{{super()}}

cat << EOF > ${out}/lib/pkgconfig/tgvoip.pc
prefix=${out}
libdir=\${prefix}/lib
includedir=\${prefix}/include

Name: tgvoip
Description: VoIP library for Telegram clients
Version: 2.4.4
Requires.private: libcrypto opus
Libs: -L\${libdir} -ltgvoip -lpthread
Libs.private: -ltg_owt -ldl -lm
Cflags: -I\${includedir}/tgvoip
EOF
{% endblock %}
