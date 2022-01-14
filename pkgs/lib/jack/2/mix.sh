{% extends '//mix/template/waf.sh' %}

{% block fetch %}
https://github.com/jackaudio/jack2/archive/v1.9.19.tar.gz
sha:9030f4dc11773351b6ac96affd9c89803a5587ebc1b091e5ff866f433327e4b0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/linux
lib/alsa/lib
lib/readline
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}

{% block waf_flags %}
--classic
--alsa=yes
--systemd=no
--readline=yes
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib; rm -rf jack libjackserver.a
{% endblock %}
