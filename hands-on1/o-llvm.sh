#!/bin/bash

FILENAMES=${1}/*.c
CLANG=${2}
for FILE in ${FILENAMES}
do
  FILE_NO_EXT=${FILE%.*}
    ${CLANG} -m32 ${FILE} -o "${FILE_NO_EXT##*/}-fla.bin" -mllvm -fla
    ${CLANG} -m32 ${FILE} -o "${FILE_NO_EXT##*/}-bcf.bin" -mllvm -bcf -mllvm -bcf_prob=100
    ${CLANG} -m32 ${FILE} -o "${FILE_NO_EXT##*/}-sub.bin" -mllvm -sub
done


