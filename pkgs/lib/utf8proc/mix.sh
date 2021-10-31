{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/JuliaStrings/utf8proc/archive/v2.6.1.tar.gz
# md5 9fe61625c105f911a2c89423f071ef1d
{% endblock %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block build %}
make prefix=${out} -j ${make_thrs} libutf8proc.a

>libutf8proc.so.2.4.1
>libutf8proc.dylib

make prefix=${out} -j ${make_thrs}
{% endblock %}
