{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/1.tar.gz
sha:80266d00f71380ec78c7c31a52ef56d624030ffa636403b5f5c1f0f42e1927c5
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
extract 0 ${src}/1.tar.gz
mv yaboot* y
mv y/Makefile ./
base64 -d << EOF > preproc.py
{% include 'preproc.py/base64' %}
EOF
cat Makefile | python3 preproc.py > _
mv _ Makefile
sed -e 's|-DXXXX|-DNDEBUG -O1|g' \
    -e 's|-g -ggnu-pubnames||g' \
    -e 's|-O3||g' \
    -e 's|-fdebug-prefix-map=.*-pipe|-pipe|' \
    -e 's|-UNDEBUG||g' \
    -i Makefile
mkdir -p ${tmp}/devtools/ymake/lang
mv y/generated/* ${tmp}/devtools/ymake/lang/
touch ${tmp}/devtools/ymake/lang/*
{% endblock %}

{% block build %}
make SHELL=$(command -v sh) S=${PWD} B=${tmp} -j ${make_thrs} \
    ${tmp}/devtools/ymake/bin/ymake \
    ${tmp}/devtools/ya/bin/ya-bin
{% endblock %}

{# ${tmp}/contrib/libs/musl/libcontrib-libs-musl.a #}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/devtools/ymake/bin/ymake ${tmp}/devtools/ya/bin/ya-bin ${out}/bin/
{% endblock %}
