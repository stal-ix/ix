{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.0.tar.gz
# md5 62310678857c30fcef4128f41f711f49
{% endblock %}

{% block deps %}
# bld lib/cxx env/std dev/build/make
{% endblock %}

{% block build %}
make -j ${make_thrs} all || echo > libxxhash.so.0.8.0
make all
{% endblock %}

{% block install %}
make prefix=${out} install
{% endblock %}

{% block test %}
make NO_C90_TEST=true test
{% endblock %}

{% block env %}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
