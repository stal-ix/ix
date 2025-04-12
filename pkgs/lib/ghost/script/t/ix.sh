{% extends '//die/c/autohell.sh' %}

{% block version %}
10.05.0
{% endblock %}

{% block fetch %}
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10050/ghostscript-{{self.version().strip()}}.tar.gz
sha:56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942
{% endblock %}

{% block lib_deps %}
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
    freetype \
    tesseract \
    leptonica \
    cups/libs \
    expat \
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
__WORDSIZE={{target.bits}}
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-macro-redefined ${CFLAGS}"
{% endblock %}
