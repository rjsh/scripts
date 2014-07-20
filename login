#!/bin/bash
kinit

tmp_dir=tmpfs
tmp_vol=/Volumes/$tmp_dir
rm -rf $tmp_vol/
diskutil erasevolume 'Case-sensitive HFS+' $tmp_dir `hdiutil attach -nomount ram://8388608`

tmp_workspace=$tmp_vol/.workspace
mkdir -p $tmp_workspace
rsync -auvP $HOME/workspace/ $tmp_workspace
mv $tmp_workspace $tmp_vol/workspace

mkdir -p $tmp_vol/{Caches,Downloads,log}
