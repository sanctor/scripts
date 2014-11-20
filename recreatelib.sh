#!/bin/bash

function recreate {

   libname=$1
   if [ -z $libname ]
   then
   libname="lib.a"
   fi

   outname=$2
   if [ -z $outname ]
   then
   outname="${libname%.*}"
   fi


   echo "Info for $libname"
   lipo -info $libname

   tmpdir=$(pwd)"/temp/"
   mkdir -p $tmpdir

   echo "Extract archs"
   namex64=$tmpdir$outname"_x86_64.a"
   lipo $libname -thin x86_64 -output $namex64 > /dev/null 2>&1
   if [ -f $namex64 ];
   then
      lipo -info $namex64
   fi


   name32=$tmpdir$outname"_i386.a"
   lipo $libname -thin i386 -output $name32 > /dev/null 2>&1
   if [ -f $name32 ];
   then
   lipo -info $name32
   fi

   namev7=$tmpdir$outname"_armv7.a"
   lipo $libname -thin armv7 -output $namev7 > /dev/null 2>&1
   if [ -f $namev7 ];
   then
   lipo -info $namev7
   fi

    namev7s=$tmpdir$outname"_armv7s.a"
    lipo $libname -thin armv7s -output $namev7s > /dev/null 2>&1
    if [ -f $namev7s ];
    then
    lipo -info $namev7s
    fi

   name64=$tmpdir$outname"_arm64.a"
   lipo $libname -thin arm64 -output $name64 > /dev/null 2>&1
   if [ -f $name64 ];
   then
   lipo -info $name64
   fi

   echo
   echo "Making libs"
   echo "iPhone"

   paramstr=""
   if [ -f $namev7 ];
   then
   paramstr=$namev7
   fi

#    if [ -f $namev7s ];
#    then
#    paramstr=$paramstr" "$namev7s
#    fi

   if [ -f $namev7s ];
   then
   paramstr=$paramstr" "$name64
   fi

   if [ ! -z "$paramstr" ];
   then
      phonedir=$(pwd)"/lib/iphone/"
      mkdir -p $phonedir

      phonelib=$phonedir$outname".a"

      lipo -output $phonelib -create $paramstr
      lipo -detailed_info $phonelib
   else
      echo "No lib for iPhone"
   fi

   echo "iPhone Simulator"

   paramstr=""
   if [ -f $name32 ];
   then
   paramstr=$name32
   fi

   if [ -f $namex64 ];
   then
   paramstr=$paramstr" "$namex64
   fi

   if [ ! -z "$paramstr" ];
   then
      simdir=$(pwd)"/lib/iphonesimulator/"
      mkdir -p $simdir

      simlib=$simdir$outname".a"

      lipo -output $simlib -create $paramstr
      lipo -detailed_info $simlib
   else
      echo "No lib for iPhone Simulator"
   fi

   echo "cleaning"

   rm -rf $tmpdir

}

work_dir=$(pwd)
for entry in "$work_dir"/*.a
do
if [ -f "$entry" ];then
recreate $(basename $entry)
fi
done
