#!/bin/bash -x

TMPDIR=`mktemp -d -p .`
TMPSCRIPT=`mktemp -p .`
FILENAMES=${1}/*.c

cp ${FILENAMES} ${TMPDIR}/


cat << 'EOS' > ${TMPSCRIPT}
#!/bin/bash
NUM=5

FILENAMES=__TMPDIR__/*.c
for FILE in ${FILENAMES}
do
  FILE_NO_EXT=${FILE%.*}
    tigress --Transform=EncodeLiterals --Functions=target_function --Environment=x86_64:Darwin:Clang:5.1 -m32 --out=${FILE_NO_EXT##*/}-encodeliteral.c ${FILE} -o ${FILE_NO_EXT##*/}-encodeliteral.bin
    tigress --Transform=EncodeArithmetic --Functions=target_function --Environment=x86_64:Darwin:Clang:5.1 -m32 --out=${FILE_NO_EXT##*/}-encodearith.c ${FILE} -o ${FILE_NO_EXT##*/}-encodearith.bin
    tigress --Transform=Flatten --Functions=target_function --Environment=x86_64:Darwin:Clang:5.1 -m32 --out=${FILE_NO_EXT##*/}-flatten.c ${FILE} -o ${FILE_NO_EXT##*/}-flatten.bin
    tigress --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=target_function --AddOpaqueCount=${NUM} --AddOpaqueKinds=true --Environment=x86_64:Darwin:Clang:5.1 -m32 --out=${FILE_NO_EXT##*/}-opaque.c ${FILE} -o ${FILE_NO_EXT##*/}-opaque.bin
    tigress --Environment=x86_64:Darwin:Clang:5.1 -m32 --Seed=0 --Transform=InitEntropy --InitEntropyKinds=vars --Transform=InitOpaque --Functions=main --InitOpaqueCount=2 --InitOpaqueStructs=list,array --Transform=AddOpaque --Functions=target_function --AddOpaqueKinds=question --AddOpaqueCount=1 --out=${FILE_NO_EXT##*/}-q.c ${FILE} -o ${FILE_NO_EXT##*/}-q.bin
    tigress --Transform=Virtualize --Functions=target_function --Environment=x86_64:Darwin:Clang:5.1 -m32 --out=${FILE_NO_EXT##*/}-virtualized.c ${FILE} -o ${FILE_NO_EXT##*/}-virtualized.bin
done
EOS

sed -i -e "s/__TMPDIR__/${TMPDIR/\//\\\/}/g" ${TMPSCRIPT}

chmod +x ${TMPSCRIPT}
sudo docker run -it --rm -v `pwd`:/mnt -w /mnt tigress-docker ./${TMPSCRIPT}

rm -rf ${TMPDIR}
rm -f ${TMPSCRIPT}
