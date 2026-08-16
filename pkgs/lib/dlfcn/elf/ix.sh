{% extends '//die/c/pybuild.sh' %}

{% block fetch %}
https://github.com/pg83/solo/archive/refs/tags/3.tar.gz
82bd474e21fdb4cce9d0e8979cb801370f960da3f50b64e57a882cab554baf07
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
