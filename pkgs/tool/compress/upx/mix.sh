{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v3.96/upx-3.96-src.tar.xz
bf5564f33fe9062bc48b53abd4b34223
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/c++/mix.sh
lib/ucl/mix.sh
dev/build/make/mix.sh
shell/cli/bash/minimal/mix.sh
dev/lang/perl5/mix.sh
env/std/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block postunpack %}
cd src
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp upx.out ${out}/bin/upx
{% endblock %}
