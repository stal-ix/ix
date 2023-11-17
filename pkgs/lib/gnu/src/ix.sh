{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/coreutils/gnulib
{% endblock %}

{% block git_commit %}
e10e5a48af3808a4857a158fab87164309cf4698
{% endblock %}

{% block git_sha %}
7a569e8d89356eed31672eba787663f3888ab6d1ef4c07d261655f344fba0dd3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/make
bld/auto
bld/python
{% endblock %}

{% block build %}
export FORCE_UNSAFE_CONFIGURE=1
python3 ./gnulib-tool.py \
    --create-testdir \
    --source-base=lib \
    --dir=posixlib \
    $(./posix-modules)
mkdir res
mv build-aux res/
mv posixlib res/
{% endblock %}

{% block install %}
mkdir ${out}/share
bsdtar czf ${out}/share/gnulib.tgz res
{% endblock %}

{% block patch %}
sed -e 's|.*setAuxDir.*saved_auxdir.*||' -i pygnulib/GLTestDir.py
{% endblock %}

{% block env %}
export src=${out}/share
{% endblock %}
