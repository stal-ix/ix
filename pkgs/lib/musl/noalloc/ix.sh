{% extends '//lib/musl/t/ix.sh' %}

{% block cpp_defines %}
__libc_realloc=realloc
__libc_free=free
__libc_malloc=malloc
__libc_calloc=calloc
{% endblock %}

{% block patch %}
{{super()}}
>src/legacy/valloc.c
>src/malloc/lite_malloc.c
{% endblock %}

{% block install %}
(
{{super()}}
)

rm -rf ${out}/lib/libc.a obj/src/malloc

# add missing open64
cp obj/src/fcntl/open.o obj/src/fcntl/open64.o
llvm-objcopy --redefine-sym=open=open64 obj/src/fcntl/open64.o

# add missing stat64
cp obj/src/stat/stat.o obj/src/stat/stat64.o
llvm-objcopy --redefine-sym=stat=stat64 obj/src/stat/stat64.o

# add missing lstat64
cp obj/src/stat/lstat.o obj/src/stat/lstat64.o
llvm-objcopy --redefine-sym=lstat=lstat64 obj/src/stat/lstat64.o

# add missing fstat64
cp obj/src/stat/fstat.o obj/src/stat/fstat64.o
llvm-objcopy --redefine-sym=__fstat=fstat64 --strip-symbol=fstat obj/src/stat/fstat64.o

# add missing pread64
cp obj/src/unistd/pread.o obj/src/unistd/pread64.o
llvm-objcopy --redefine-sym=pread=pread64 obj/src/unistd/pread64.o

# add missing ftruncate64
cp obj/src/unistd/ftruncate.o obj/src/unistd/ftruncate64.o
llvm-objcopy --redefine-sym=ftruncate=ftruncate64 obj/src/unistd/ftruncate64.o

# add missing lseek64
cp obj/src/unistd/lseek.o obj/src/unistd/lseek64.o
llvm-objcopy --redefine-sym=__lseek=lseek64 --strip-symbol=lseek obj/src/unistd/lseek64.o

# add missing readdir64_r
cp obj/src/dirent/readdir_r.o obj/src/dirent/readdir64_r.o
llvm-objcopy --redefine-sym=readdir_r=readdir64_r obj/src/dirent/readdir64_r.o

ar q ${out}/lib/libc.a $(find obj -type f -name '*.o' | sort)
ranlib ${out}/lib/libc.a
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-D__STDC_ISO_10646__=201505L \${CPPFLAGS}"
{% endblock %}
