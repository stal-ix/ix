{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz
a6eb7fb1f2c21fa80030a47993853e92
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/lz4/mix.sh
lib/xz/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block build %}
(cd lib && make PREFIX=${out} -j ${make_thrs} install-static install-includes)
(cd programs && make PREFIX=${out} -j ${make_thrs} install)
{% endblock %}

{% block env %}
export COFLAGS="--with-zstd=${out} \${COFLAGS}"
{% endblock %}

{% block test %}
test -f ${out}/include/zstd.h
{% endblock %}
