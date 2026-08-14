{% extends '//die/c/pybuild.sh' %}

{% block fetch %}
https://github.com/pg83/solo/archive/refs/tags/1.tar.gz
4d703ee2f30309a4f39addd9813ad7c3ac26bf93463da3e9adeb1724456f7284
{% endblock %}

{% block std_box %}
bin/python/12(intl_ver=no)
bld/pkg/config
{{super.super()}}
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block pybuild_target %}
dlfcn
{% endblock %}

{% block install %}
mkdir -p ${out}/lib
mkdir -p ${out}/include
cp dlfcn ${out}/lib/libdlstub.a
cp dlfcn.h ${out}/include/
{% endblock %}

{% block env %}
export ac_cv_func_dlerror=yes
export ac_cv_func_dlopen=yes
export ac_cv_func_dlsym=yes
export ac_cv_func_dladdr=yes
export ac_cv_func_dlclose=yes
export ac_cv_lib_dl_dlerror=yes
export ac_cv_lib_dl_dlopen=yes
export ac_cv_lib_dl_dlsym=yes
export ac_cv_lib_dl_dladdr=yes
export ac_cv_lib_dl_dlclose=yes
export ac_cv_search_dlopen=-ldl
{% endblock %}
