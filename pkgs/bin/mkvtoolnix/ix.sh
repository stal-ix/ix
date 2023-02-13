{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/mbunkus/mkvtoolnix/-/archive/release-74.0.0/mkvtoolnix-release-74.0.0.tar.bz2
sha:7cda4e4932f07e8b7c43528fa78a3904ad33b6c9f5f3951c70c4e735466c932d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gmp
lib/fmt
lib/ebml
lib/cmark
lib/boost
lib/pugixml
lib/matroska
lib/utf8/cpp
lib/xiph/ogg
lib/qt/6/svg
lib/qt/6/base
lib/qt/6/deps
lib/xiph/vorbis
lib/json/nlohmann
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/ruby
bld/gettext
bld/fake(tool_name=xsltproc)
{% endblock %}

{% block configure_flags %}
--disable-gui
--enable-qt6
--enable-qt5=no
--disable-qt5
--enable-static-qt
--with-qmake6=ixqmake6
--with-docbook_xsl_root=${out}
{% endblock %}

{% block setup %}
for l in $(echo "${QT_PATH}" | tr ':' ' '); do
    export CPPFLAGS="-I${l}/include/QtCore ${CPPFLAGS}"
    export CPPFLAGS="-I${l}/include/QtGui ${CPPFLAGS}"
    export CPPFLAGS="-I${l}/include/QtWidgets ${CPPFLAGS}"
    export CPPFLAGS="-I${l}/include/QtSvg ${CPPFLAGS}"
    export CPPFLAGS="-I${l}/include/QtNetwork ${CPPFLAGS}"
    export CPPFLAGS="-I${l}/include/QtConcurrent ${CPPFLAGS}"
done
{% endblock %}

{% block setup_tools %}
mkdir QT

echo "${QT_PATH}" | tr ':' '\n' | while read l; do
    cp -R ${l}/* QT/
done

qqq=$(dirname $(dirname $(which qmake6)))

cp -R ${qqq}/* QT/

cd QT
ln -s bin libexec
cd ..

cat << EOF > qt.conf
[Paths]
Prefix = ${PWD}/QT
EOF

cat qt.conf

cat << EOF > ixqmake6
#!/usr/bin/env sh
qmake6 -qtconf ${PWD}/qt.conf "\${@}"
EOF

chmod +x ixqmake6
{% endblock %}

{% block build %}
./drake -j ${make_thrs}
touch doc/man/mkvmerge.1
touch doc/man/mkvinfo.1
touch doc/man/mkvextract.1
touch doc/man/mkvpropedit.1
{% endblock %}

{% block install %}
./drake install
{% endblock %}
