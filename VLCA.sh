#!/bin/bash
# Autor IsVlad
#for playing mkv+mka in vlc

mka="$1"
mkv="${mka/mka/mkv}"

mka=${readlink -f "$mka"}
mka=${mka//%/%25}
mka=${mka// /%20}
mka=${mka//+/%2B}

mkv=${readlink -f "$mkv"}
mkv=${mkv//%/%25}
mkv=${mkv// /%20}
mkv=${mkv//+/%2B}

mka="file://"$mka
mkv="file://"$mkv
sfparam=":input-slave="
fcparam=":file-caching=1000 :audio-language=ukrainian,russian -f"
echo $mkv $sfparam$mka $fcparam
vlc $mkv $sfparam$mka $fcparam
