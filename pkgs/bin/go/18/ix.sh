{% extends '//bin/go/4/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.18.4.tar.gz
sha:283442519c28f5c24dd8c849ebe0570a3ad92cd94610378b33b2053f60391fdf
{% endblock %}

{% block bld_tool %}
bld/tar
bld/perl
bin/go/4
bld/python
{{super()}}
{% endblock %}

{% block run_data %}
aux/ca-bundle
{% endblock %}

{% block setup_tools %}
cat << EOF > xcrun
#!$(which python3)
import sys
import subprocess

subprocess.check_call(sys.argv[1:])
EOF

chmod +x xcrun
{% endblock %}

{% block patch %}
{{super()}}
find . -type f -name '*.go' | while read l; do
    sed -e "s|/etc/.*/ca-bundle.crt|${CA_BUNDLE}|" -i ${l}
done
{% endblock %}

{% block build %}
cp -R ${GOROOT_BOOTSTRAP} ${tmp}/boot

find ${tmp}/boot | while read l; do
    chmod +rwx ${l}
done

export GOCACHE=${tmp}
export GOROOT=${tmp}/boot
export GOROOT_BOOTSTRAP=${tmp}/boot

{{super()}}
{% endblock %}

{% block cgo %}
{% endblock %}

{% block setup %}
export CPPFLAGS="-fno-color-diagnostics ${CPPFLAGS}"
{% endblock %}
