{% extends '//mix/template/std.sh' %}

{% block bld_tool %}
shell/cli/bash/minimal/mix.sh
dev/build/pkg-config/mix.sh
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
