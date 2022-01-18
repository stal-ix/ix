{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/aklomp/base64/archive/refs/tags/v0.4.0.tar.gz
dc02ea0324279df0ecdc23d519dbcaa0
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block setup_tools %}
ln -s $(which llvm-objcopy) objcopy
{% endblock %}

{% block build %}
make bin/base64
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp bin/base64 ${out}/bin
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
