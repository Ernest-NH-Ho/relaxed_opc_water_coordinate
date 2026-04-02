#!/bin/bash
# set -e

SUDO_PASS=$(cat $HOME/.lazy.txt)

# echo "start compression model in 3HEIWA from windows SSD"
# echo $SUDO_PASS | sudo -S sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
# count=0
# folder_name="HEIWA3P_NaCl015_sigmoid_LeCha1_rot1_hd5"
# for item in /media/ncku-che/windows-drive/ErnestHo/Proj2026-ESM3_34HEIWA/models/$folder_name/*.tar.gz; do
#     if (( count % 2 == 0 )); then
#         echo $SUDO_PASS | sudo -S sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
#     fi
#     echo "start compression $item"
#     item_base=$(basename "$item")
#     item_base_nofiletype="${item_base%.tar.gz}"
#     mkdir $HOME/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/$folder_name/$item_base_nofiletype
#     tar --use-compress-program='pigz -d -p 24' --blocking-factor=4096 -xf $item -C $HOME/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/$folder_name/$item_base_nofiletype
#     tar --blocking-factor=4096 -cf - $HOME/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/$folder_name/$item_base_nofiletype | pigz -p 24 > "/media/ncku-che/OneTouch_EH/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/$folder_name/$item_base"
#     # rm -r $HOME/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/$folder_name/$item_base_nofiletype
#     # dd if=$item of="/media/ncku-che/OneTouch_EH/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/$folder_name/$item_base" bs=4M status=progress oflag=direct
#     ((count++))
# done

# Compress to external drive
echo "start compression gmx simulations"
count=0
destination_folder="/media/ncku-che/EXTERNAL_USB/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/data_20251228/ExpV_H2ONaCl_SelfGate_allrot_NaCl"
# destination_folder="/media/ncku-che/EXTERNAL_USB/Databases"
source_dir="/home/ncku-che/ErnestHo_NCKU/Proj2026-ESM3_34HEIWA/models/data_20251228/ExpV_H2ONaCl_SelfGate_allrot_NaCl"
# source_dir="/home/ncku-che/Databases"
mkdir -p $destination_folder
cd $source_dir
# ls 
for subfolder in $source_dir/*; do
    if [[ -d $subfolder ]]; then
        # echo $SUDO_PASS | sudo -S sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
        subfolder_base=$(basename "$subfolder")
        # destination="$destination_folder/$subfolder_base.tar.gz"
        # tar --blocking-factor=4096 -cf - $subfolder | pigz -p 24 > $destination
        if [[ ! -d $destination_folder/$subfolder_base ]]; then
            # echo $subfolder_base
            mkdir -p $destination_folder/$subfolder_base
            
            cd $subfolder
            for item in ./*; do
                item_base=$(basename "$item")
                destination=$destination_folder/$subfolder_base/$item_base.tar.gz
                if [[ ! -f $destination ]]; then
                    if (( count % 8 == 0 )); then
                        echo $SUDO_PASS | sudo -S sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
                    fi
                    echo "start compression $item"
                    tar --blocking-factor=4096 -cf - $item | pigz -p 24 > $destination
                    ((count++))
                fi
            done
        fi
    fi
done

# wait
# echo "All copies completed!"
echo $SUDO_PASS | sudo -S sync 
# echo $SUDO_PASS | sudo -S shutdown -P +1