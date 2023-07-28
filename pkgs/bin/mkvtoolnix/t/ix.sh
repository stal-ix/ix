{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/mbunkus/mkvtoolnix/-/archive/release-78.0/mkvtoolnix-release-78.0.tar.bz2
sha:d468d80e7f49dd5f52fce0c51e56379999abe4b1f62ec3db1e8b5178eecb3272
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
lib/xiph/vorbis
lib/json/nlohmann/11
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
bld/ruby
bld/qt/6
bin/rsync
bld/gettext
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block configure_flags %}
--enable-static-qt
--with-qmake6=ixqmake6
--with-docbook_xsl_root=${out}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block setup_tools %}
mkdir QT

echo "${QT_PATH}" | tr ':' '\n' | while read l; do
    rsync -a ${l}/* QT/
done

qqq=$(dirname $(dirname $(which qmake6)))

rsync -a ${qqq}/* QT/

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
{{super()}}
{% endblock %}

{% block build %}
./drake -j ${make_thrs}
{% endblock %}

{% block install %}
./drake install
{% endblock %}
