{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/wmcbrine/PDCurses
{% endblock %}

{% block git_commit %}
977dcc9a31371b08db2cfa6ff92b04b89940fc00
{% endblock %}

{% block git_sha %}
4c731cde3eb6786b1cd6db47b52e5abcb597d63ae28698cf2177f0309671f910
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/2
{% endblock %}

{% block step_unpack %}
{{super()}}
cd sdl2
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include/xcurses
cp pdcurses.a ${out}/lib/libpdcurses.a
cp ../*.h ${out}/include/xcurses/
cd ${out}/lib
ln -s libpdcurses.a libcurses.a
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/xcurses \${CPPFLAGS}"
{% endblock %}
