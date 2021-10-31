{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/google/brotli/archive/refs/tags/v1.0.9.tar.gz
# md5 c2274f0c7af8470ad514637c35bcee7d
{% endblock %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/tools/mix.sh
# bld env/c/mix.sh
# bld env/bootstrap/package.py
{% endblock %}

{% block build %}
make -j ${make_thrs} lib
{% endblock %}

{% block install %}
cp -R ./c/include ${out}/
mkdir ${out}/lib && cp libbrotli.a ${out}/lib/
{% endblock %}
