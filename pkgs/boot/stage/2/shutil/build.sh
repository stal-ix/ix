$unzip ${src}/*.zip && cd shutil*

export CC=gcc

. ./build.sh

cp() {
    ./cat $1 > $2
    ./chmod 493 $2
}

./mkdir ${out}/bin

for i in mkdir cat tr dirname echo chmod rm test; do
    cp $i ${out}/bin/$i
done
