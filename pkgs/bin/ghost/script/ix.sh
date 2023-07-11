{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10012/ghostscript-10.01.2.tar.gz
sha:a4cd61a07fec161bee35da0211a5e5cde8ff8a0aaf942fc0176715e499d21661
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/idn
lib/tiff
lib/jpeg
lib/paper
lib/lcms/2
lib/jbig2dec
lib/freetype
lib/jpeg/open
lib/fontconfig
{% endblock %}

{% block patch %}
# from https://gitlab.archlinux.org/archlinux/packaging/packages/ghostscript/-/blob/main/PKGBUILD
rm -rf \
    tesseract \
    leptonica \
    cups/libs \
    expat \
    ijs \
    jbig2dec \
    jpeg \
    lcms2mt \
    libpng \
    openjpeg \
    tiff \
    zlib \
    gpdl \
    Resource/CMap
{% endblock %}

{% block configure_flags %}
--with-ijs
--with-jbig2dec
--with-drivers=ALL
--with-fontpath=${out}/share/fonts/gsfonts
--without-versioned-path
--enable-fontconfig
--enable-freetype
--enable-openjpeg
--with-system-libtiff
--with-libpaper
--disable-compile-inits
{% endblock %}

{% block cpp_defines %}
ft_sprintf=sprintf
{% endblock %}
