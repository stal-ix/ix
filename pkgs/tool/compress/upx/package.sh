{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/upx/upx/releases/download/v3.96/upx-3.96-src.tar.xz
# md5 bf5564f33fe9062bc48b53abd4b34223
{% endblock %}

{% block deps %}
# bld lib/z/package.sh
# bld lib/cxx/package.sh
# bld lib/ucl/package.sh
# bld dev/build/make/package.sh
# bld shell/cli/bash/minimal/package.sh
# bld dev/lang/perl5/package.sh
# bld env/std/package.sh
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
