{% extends '//die/fonts.sh' %}

{% block fetch %}
https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg
sha:e084f247273c91513eb4d3927a78aee5f9bfc68daf79bb33b330afcbe7ffb7dc
{% endblock %}

{% block bld_tool %}
bld/tar
bin/p7zip
{% endblock %}

{% block unpack %}
mkdir src; cd src
7z x ${src}/*dmg
find . -name '*.pkg' | while read l; do
    7z x "${l}"
done
bsdtar xf Payload*
{% endblock %}
