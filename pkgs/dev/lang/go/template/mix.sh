{% extends '//mix/template/template.sh' %}

{% block bld_deps %}
shell/cli/bash/minimal/mix.sh
dev/build/pkg-config/mix.sh
env/std/mix.sh
{% block go_bld_deps %}
{% endblock %}
{% endblock %}

{% block postunpack %}
cd src
{% endblock %}

{% block cflags %}
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
