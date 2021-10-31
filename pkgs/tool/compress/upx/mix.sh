{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/upx/upx/releases/download/v3.96/upx-3.96-src.tar.xz
# md5 bf5564f33fe9062bc48b53abd4b34223
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/cxx/mix.sh
# bld lib/ucl/mix.sh
# bld dev/build/make/mix.sh
# bld shell/cli/bash/minimal/mix.sh
# bld dev/lang/perl5/mix.sh
# bld env/std/mix.sh
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
