{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/google/brotli/archive/refs/tags/v1.0.9.tar.gz
# md5 c2274f0c7af8470ad514637c35bcee7d
{% endblock %}

{% block deps %}
# bld dev/build/make env/tools env/c env/bootstrap
{% endblock %}

{% block build %}
make -j ${make_thrs} lib
{% endblock %}

{% block install %}
cp -R ./c/include ${out}/
mkdir ${out}/lib && cp libbrotli.a ${out}/lib/
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lbrotli \${LDFLAGS}"
{% endblock %}
