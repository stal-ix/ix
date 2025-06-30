{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://download.freebsd.org/snapshots/amd64/amd64/ISO-IMAGES/14.3/FreeBSD-14.3-STABLE-amd64-20250626-fad4064226b2-271785-disc1.iso.xz
93cf83390654e33b86bde02655b62a86c9eac3390d54c9b04f55d96f3d01c73b
{% endblock %}

{% block unpack %}
mkdir src
cd src
7z x ${src}/F*
7z x F*
cd usr/freebsd-dist
bsdtar --no-same-permissions --no-same-owner -x -f base.txz
{% endblock %}

{% block bld_tool %}
bin/p7zip
{% endblock %}

{% block install %}
mkdir -p ${out}/usr
cp -R libexec ${out}/
cp -R lib ${out}/
cp -R usr/include ${out}/usr/
cp -R usr/lib ${out}/usr/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export CPPFLAGS="--sysroot=${out} -isystem${out}/usr/include -lc"
{% endblock %}
