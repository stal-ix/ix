{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://golang.org/dl/go1.4-bootstrap-20170531.tar.gz
# md5 d2cc61cb9f829b3510ee39c0c5568014
{% endblock %}

{% block bld_deps %}
shell/cli/bash/minimal/mix.sh
env/std/mix.sh
{% endblock %}

{% block postunpack %}
cd src
{% endblock %}

{% block cflags %}
export GOROOT_FINAL="${out}/go"
{% endblock %}

{% block patch %}
cat run.bash | grep -v 'time go test' > _ && mv _ run.bash
{% endblock %}

{% block build %}
bash ./all.bash
{% endblock %}

{% block install %}
cd ${out} && ln -s go/bin ./
{% endblock %}

{% block env %}
export GOROOT_BOOTSTRAP="${GOROOT_FINAL}"
{% endblock %}
