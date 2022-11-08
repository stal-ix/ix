{% extends '//lib/curses/n/t/ix.sh' %}

{% block use_data %}
aux/terminfo
{% endblock %}

{% block patch %}
>misc/run_tic.in
{{super()}}
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

for i in *.a; do
    ln -s ${i} $(echo ${i} | tr -d 'w')
done

cd pkgconfig

cp ncursesw.pc ncurses.pc
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-curses=${out} --with-ncurses=${out} \${COFLAGS}"
{% endblock %}
