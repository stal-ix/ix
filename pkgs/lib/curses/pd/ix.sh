{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/wmcbrine/PDCurses
{% endblock %}

{% block git_commit %}
977dcc9a31371b08db2cfa6ff92b04b89940fc00
{% endblock %}

{% block git_sha %}
11bd44e412f2eadd28186809317c7da5c82db918a7bf1354e26c8acfce627602
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
