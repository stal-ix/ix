{% extends '//bin/go/4/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.19.3.tar.gz
sha:a26c4e2be235a984a31e466a6cd40c617c5c9ebee07f0c8ca15077dc024e3759
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_tool %}
bld/tar
bld/perl
bld/python
{{super()}}
{% endblock %}

{% block use_data %}
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
