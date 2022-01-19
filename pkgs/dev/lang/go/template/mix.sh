{% extends '//mix/template/c_std.sh' %}

{% block bld_tool %}
dev/tool/bash
bin/pkg-config
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block setup %}
export GOROOT_FINAL="${out}"
{% block go_cflags %}
{% endblock %}
{% endblock %}

{% block build %}
bash ./all.bash
{% endblock %}

{% block install %}
cd .. && mv * ${out}/
{% endblock %}

{% block env %}
export GOROOT_BOOTSTRAP="${GOROOT_FINAL}"
{% endblock %}

{% block test %}
export GOPATH="${PWD}"
export GOCACHE="${PWD}"
export GOROOT="${GOROOT_FINAL}"
export PATH="${GOROOT}/bin:${PATH}"

cat << EOF > hello.go
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
EOF

go run hello.go
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
