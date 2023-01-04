{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/wmcbrine/PDCurses/archive/2fa0f10dd844da47ee83c05a40a1ec541ceb95e1.zip
sha:1c68c676b6a684898dd5303291074a8496ecd2039c1b9f20ecc42fdb5a9d189e
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/2
{% endblock %}

{% block unpack %}
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
