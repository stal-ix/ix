{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/raw/refs/heads/main/Makefile.gz
sha:a4c09a6418ab814ad33ebc4e9248e8c12e5c39d2e5708ec2ba578c7fa80cdd05
{% endblock %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
1e46384bba9016b27f7b0251fe9971db3c65fe6e
{% endblock %}

{% block git_sha %}
f900bf83c523e4ae2688381a15c8ff5915e160a45c6f94fdfed8d1f4172f2ea7
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/make
bin/ya/clang
bin/clang/18
bin/util/linux
bld/fake/binutils
{% endblock %}

{% block script_init_env %}
{{super()}}
export CFLAGS=
export LDFLAGS=
export CTRFLAGS=
export OPTFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
{% endblock %}

{% block step_unpack %}
{{super()}}
gzip -c -d ${src}/Makefile.gz > Makefile
{% endblock %}

{% block build %}
make S=${PWD} B=${tmp} -j 16 ${tmp}/devtools/ya/bin/ya-bin
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/devtools/ya/bin/ya-bin ${out}/bin/
{% endblock %}
