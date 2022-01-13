{% extends '//mix/template/c_std.sh' %}

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

{% block bld_tool %}
dev/tool/python
dev/build/pkg-config
{% endblock %}

{% block patch %}
find . | grep wscript | while read l; do
    sed -e 's|cshlib|cstlib|g'     \
        -e 's|cxxshlib|cxxstlib|g' \
        -e 's|stdc++|c|g'          \
        -i ${l}
done

find . -type f | while read l; do
    sed -e 's|Bdynamic|Bstatic|g' -i ${l}
done
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}

{% block configure %}
python3 waf configure \
    --prefix="${out}" \
    --classic         \
    --alsa=yes        \
    --systemd=no      \
    --readline=yes
{% endblock %}

{% block build %}
python3 waf build
{% endblock %}

{% block install %}
python3 waf install

cd ${out}/lib

rm -rf jack libjackserver.a
{% endblock %}
