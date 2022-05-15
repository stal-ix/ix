{% extends '//mix/cmake.sh' %}

{% block fetch %}
{% include '//bin/telegram/desktop/unwrap/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
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
{{hooks.gen_pc('tgvoip', '2.4.4')}}
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/tgvoip \${CPPFLAGS}"
{% endblock %}
