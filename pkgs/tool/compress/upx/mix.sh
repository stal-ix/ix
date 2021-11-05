{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v3.96/upx-3.96-src.tar.xz
bf5564f33fe9062bc48b53abd4b34223
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/cxx/mix.sh
lib/ucl/mix.sh
dev/build/make/mix.sh
shell/cli/bash/minimal/mix.sh
dev/lang/perl5/mix.sh
env/std/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block build %}
make -j ${make_thrs} -C src all
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp src/upx.out ${out}/bin/upx
{% endblock %}
