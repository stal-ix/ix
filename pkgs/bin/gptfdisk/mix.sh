{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/gptfdisk/gptfdisk-1.0.8.tar.gz
sha:95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/c++
lib/popt
lib/curses
bin/util/linux
{% endblock %}

{% block patch %}
sed -e 's|ncursesw/||' -i gptcurses.cc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gdisk sgdisk cgdisk fixparts ${out}/bin/
{% endblock %}
