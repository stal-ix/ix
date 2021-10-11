{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/upx/upx/releases/download/v3.96/upx-3.96-src.tar.xz
# md5 bf5564f33fe9062bc48b53abd4b34223
{% endblock %}

{% block deps %}
# bld lib/z lib/cxx lib/ucl dev/build/make shell/bash/minimal dev/lang/perl5 env/std
{% endblock %}

{% block cflags %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block build %}
make -j ${make_thrs} -C src all
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp src/upx.out ${out}/bin/upx
{% endblock %}
