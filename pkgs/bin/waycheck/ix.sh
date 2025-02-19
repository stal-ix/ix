{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/serebit/waycheck/-/archive/v1.6.0/waycheck-v1.6.0.tar.bz2
sha:822c0026f287d08744615598f145d8de95a5bca556e94ec63ca9740b5ceafede
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/wayland
{% endblock %}

{% block bld_tool %}
bld/qt/6
bin/rsync
bld/gnome
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

export QMAKE6=$(command -v qmake6)

cat << EOF > qmake6
#!/usr/bin/env sh
${QMAKE6} -qtconf ${PWD}/qt.conf "\${@}"
EOF

chmod +x qmake6
{% endblock %}

{% block configure %}
export QMAKE=qmake6
export QMAKE6=qmake6
{{super()}}
{% endblock %}
