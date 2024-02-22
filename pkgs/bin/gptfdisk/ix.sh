{% extends '//die/c/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/gptfdisk/gptfdisk-1.0.10.tar.gz
sha:2abed61bc6d2b9ec498973c0440b8b804b7a72d7144069b5a9209b2ad693a282
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/c++
lib/popt
lib/curses
lib/linux/util
{% endblock %}

{% block patch %}
sed -e 's|ncursesw/||' -i gptcurses.cc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gdisk sgdisk cgdisk fixparts ${out}/bin/
{% endblock %}
