{% extends '//die/rust/cargo.sh' %}

{% include 'ver.sh' %}

# noauto

{% block bld_libs %}
lib/bcache/fs
{% endblock %}

{% block host_libs %}
{{super()}}
lib/llvm/19
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/rust/helpers/patch/bindgen
{% endblock %}

{% block patch %}
{{super()}}
patch_bindgen vendored
{% endblock %}

{% block build %}
>libbcachefs.a
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bcachefs ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
