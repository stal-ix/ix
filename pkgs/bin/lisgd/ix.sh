{% extends '//die/make.sh' %}

{% block fetch %}
https://git.sr.ht/~mil/lisgd/archive/0.3.4.tar.gz
sha:1f10c92d0b98dac33577f2be17d9aa86d533926c32eeac4ddf37afabb4a7641f
{% endblock %}

{% block bld_libs %}
lib/c
lib/input
lib/wayland
{% endblock %}

{% block patch %}
sed -e 's|-lX11||' -i Makefile

mkdir X11

cat << EOF > X11/Xlib.h
typedef void Display;
#define XOpenDisplay(X) NULL
#define DefaultScreen(X) 0
#define DisplayWidth(X, Y) 0
#define DisplayHeight(X, Y) 0
EOF
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}
