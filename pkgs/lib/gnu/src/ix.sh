{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/coreutils/gnulib
{% endblock %}

{% block git_commit %}
e10e5a48af3808a4857a158fab87164309cf4698
{% endblock %}

{% block git_sha %}
c93ad5af12e52ec419fc8b20696b27c967bd920a434415e23720a4069519ae93
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

{% block git_version %}
v3
{% endblock %}
