{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.0.tar.gz
62310678857c30fcef4128f41f711f49
{% endblock %}

{% block bld_libs %}
lib/c++/mix.sh
{% endblock %}

{% block build %}
make -j ${make_thrs} all || echo > libxxhash.so.0.8.0
make all
{% endblock %}

{% block test %}
make NO_C90_TEST=true test
{% endblock %}

{% block env %}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
