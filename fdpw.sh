#!/bin/bash
read -p "需要解密的压缩包" flpath
read -p "数字密码位数" length
#flname=` unzip -l $flpath | sed -n '4p' | rev | cut -d ' ' -f 1 | rev `
for (( i=0; i<$((10**$length)); i=i+1))
do
        ratio=$((${i}*100/(10**${length})))
        printf  "progress:%2d%%\r" "${ratio}"
        a=`printf "%0${length}i\n" $i`
        unzip -d .Atemp -o -P $a $flpath $flname  > .a 2> .b
        if [ "$(cat .b | wc -l)" == "0" ];
        then echo "the passwd is ${i}${j}${k}${l}${m}${n}" > result.txt
        rm -r .Atemp .a .b
        printf '\n'
        echo finish
        exit
        else
        echo "error" > result.txt
        fi
done
echo finish
