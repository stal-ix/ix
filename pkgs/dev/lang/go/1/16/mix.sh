{% extends '//dev/lang/go/template/mix.sh' %}

{% block fetch %}
https://golang.org/dl/go1.16.5.src.tar.gz
f3c06704e536dcca1814b16dbcdc4a36
{% endblock %}

{% block bld_tool %}
gnu/tar/mix.sh
dev/lang/go/1/4/mix.sh
dev/build/python/mix.sh
dev/lang/perl5/mix.sh
{{super()}}
{% endblock %}

{% block toolconf %}
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
