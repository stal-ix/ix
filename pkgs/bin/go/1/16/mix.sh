{% extends '//bin/go/t/mix.sh' %}

{% block fetch %}
https://golang.org/dl/go1.16.5.src.tar.gz
f3c06704e536dcca1814b16dbcdc4a36
{% endblock %}

{% block bld_tool %}
bld/tar
bin/go/1/4
bld/python
bld/perl
{{super()}}
{% endblock %}

{% block setup_tools %}
cat << EOF > xcrun
#!$(which python3)
{% include 'xcrun.py' %}
EOF

chmod +x xcrun
{% endblock %}

{% block go_cflags %}
export CGO_ENABLED=0
{% endblock %}

{% block patch %}
sed -e 's/TestMachoIssue32233/skipTestMachoIssue32233/' -i cmd/link/internal/ld/dwarf_test.go
sed -e 's/TestCurrent/testCurrent/' -i os/user/user_test.go
sed -e 's/TestLookup/testLookup/' -i os/user/user_test.go
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
