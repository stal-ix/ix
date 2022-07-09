{% extends '//die/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/gptfdisk/gptfdisk-1.0.9.tar.gz
sha:dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2
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
