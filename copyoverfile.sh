#!/usr/bin/env bash

plugin_update_path='/home/thang/THANGSUBMISS/pluginupdate'

echo 'Input name of git repository : Example: educef'
declare -a arr;
while : ; do
    read a;
    echo "Press :q to submit";
    if [[ ${a} = ":q" ]]; then
        break;
    fi
    arr=( "${arr[@]}" "$a" );
done
if [[ ${#arr[@]} < 1  ]]; then
    arr=(jogy appexpo architect flexi grass hearty lawplus magiclean minimalist seogrow solabiz solala transera)
    #arr=(jogy)
fi
        echo 'If something wrong press ctr + c. Press any key to submit';
        echo ${arr[@]};
read enter;

for git in ${arr[@]}; do
#                cd /home/thang/solazu-git/${git}/
#                git checkout develop
#                git add .
#                git commit -m "Fix one click import demo solazu unyson plugin";
#   for file in "$plugin_update_path"/*; do
#        if [[ -d "/home/thang/solazu-git/${git}/code/theme/plugins/" ]]; then
#                echo "cp "  ${file}  " to " /home/thang/solazu-git/${git}/code/theme/plugins/;
#                git checkout develop
#                cp -rf ${file} /home/thang/solazu-git/${git}/code/theme/plugins/
#                git add .
#                git commit -m "update plugin "$(basename ${file}) ;
#            else
#                echo /home/thang/solazu-git/${git}/code/theme/plugins/ "is not directory";
#        fi
#    done
#sed -i.bak "s|\/\* That's all, stop editing! Happy blogging. \*\/|define('FS_METHOD','direct');|g"
        #sed  -n 's#if (!empty($drop_sql)) {#khongduockhongduoc \n if (!$wpdb->query($drop_sql)) {#g' /home/thang/solazu-git/${git}/plugin/solazu-unyson/framework/extensions/backups/includes/module/tasks/type/class-slz-ext-backups-task-type-db-restore.php
        #new_line=$(sed  -n '' /home/thang/solazu-git/jogy/plugin/solazu-unyson/framework/extensions/backups/includes/module/tasks/type/class-slz-ext-backups-task-type-db-restore.php)
        #new_line=$(ls -1)
        #echo "$new_line";

        ########### zip plugin ###############
            cd /home/thang/solazu-git/${git}/plugin
            zip -r solazu-unyson.zip *
            cp -rf /home/thang/solazu-git/${git}/plugin/solazu-unyson.zip /home/thang/solazu-git/${git}/code/theme/plugins/
            rm -f /home/thang/solazu-git/${git}/plugin/solazu-unyson.zip
        ############## end zip ###############
               # gedit /home/thang/solazu-git/${git}/plugin/solazu-unyson/framework/extensions/backups/includes/module/tasks/type/class-slz-ext-backups-task-type-db-restore.php & disown;


                # update changelog
#                sed -e 's#== Change log ==#== Changelog ==#g' /home/thang/solazu-git/${git}/code/theme/change_log.txt > log-${git}.txt
                #sed  -i 's#== Changelog ==#== Changelog ==\n\n\n=   - 13 July 2018 =\n\nUpdate Visual Composer 5.5.2\nUpdate Revolution Slider 5.4.8\nFixed: One click import demo.#g' /home/thang/solazu-git/${git}/code/theme/change_log.txt
                #update changelog.php
                #sed -i 's#<dl class="slz-changelog-list">#<dl class="slz-changelog-list">\n\n<dd>\n<h3>Version   - 13 July 2018 </h3>\n<div class="des">\n<div class="update-content">\n<ul>\n<li>Update Visual Composer 5.5.2</li>\n<li>Update Revolution Slider 5.4.8</li>\n<li>Fixed: One click import demo.</li>\n</ul>\n</div>\n</div>\n</dd>#g' /home/thang/solazu-git/${git}/code/theme/framework-customizations/theme/views/change-log.php > log-${git}.txt


                #open file
#                    gedit /home/thang/solazu-git/${git}/code/theme/style.css & disown;
#                    gedit /home/thang/solazu-git/${git}/code/theme/change_log.txt & disown;
#                    gedit /home/thang/solazu-git/${git}/code/theme/framework-customizations/theme/views/change-log.php & disown;



            cd /home/thang/solazu-git/${git}
                git checkout develop
                git add .
                git commit -m "Update unyson.zip";
                git push origin develop

           # mkdir /home/thang/themesubmit/${git};
           # cd /home/thang/themesubmit/${git};
         #   cp -r /home/thang/solazu-git/${git}/code/theme ${git};
          #  zip -r ${git}.zip ${git};

echo 'ok';
done
