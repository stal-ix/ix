mkdir tmpfs
mount --bind tmpfs ./${store}/build
mkdir ./${store}/build/trash
mount --bind ./${store}/build/trash ./${store}/trash
