{% extends '//die/c/pybuild.sh' %}

{% block fetch %}
https://github.com/pg83/solo/archive/refs/tags/2.tar.gz
eb28c43dc2eadb14dcdfc3768b2831ff42311f9f0a1001b1891faaf1f98de55a
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
cp lib/dlfcn.h ${out}/include/
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
