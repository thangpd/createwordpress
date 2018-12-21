#!/usr/bin/env bash

plugin_update_path='/home/thang/THANGSUBMISS/pluginupdate'
path_git_theme='/home/thang/solazu-git'

declare -a arr;

echo 'Input name of git repository to packed : Example: educef'
echo 'Or :q to get default array theme in script';

pack_theme () {
            # $1 : relative path to plugin directory of theme
            echo $path_git_theme/${git}/$1;
           	cd $path_git_theme/${git}
            git pull --no-edit

            ########### zip plugin ###############
            test -d $path_git_theme/${git}/plugin/solazu-unyson && zip -r $path_git_theme/${git}/plugin/solazu-unyson.zip $path_git_theme/${git}/plugin/solazu-unyson
            if [[ -e $path_git_theme/${git}/plugin/solazu-unyson.zip  ]]; then
                cp -rf $path_git_theme/${git}/plugin/solazu-unyson.zip $path_git_theme/${git}/$1/plugins/
                rm -f $path_git_theme/${git}/plugin/solazu-unyson.zip
            fi
            ############## end zip ###############

           	   cd $path_git_theme/${git}
               git checkout develop
               git add .
               git commit -m "Pulled Update changelog unyson.zip";
               git push origin develop

}

open_changelog () {
     #open file
     echo 'open changelog';
        gedit $path_git_theme/${git}/$1/style.css & disown;
		gedit $path_git_theme/${git}/$1/change_log.txt & disown;
		gedit $path_git_theme/${git}/$1/framework-customizations/theme/views/change-log.php & disown;
}

accept (){
while : ; do
echo 'If something wrong press ctr + c. Press any key to submit';
    read accept;
    echo "Press :q to submit";
    if [[ ${accept} = ":q" ]]; then
        break;
    fi
done
}

while : ; do
    read a;
    echo "Press :q to submit";
    if [[ ${a} = ":q" ]]; then
        break;
    fi
    arr=( "${arr[@]}" "$a" );
done

if [[ ${#arr[@]} < 1  ]]; then
	#arr=(jogy appexpo architect flexi grass hearty lawplus magiclean minimalist seogrow solabiz solala transera)
	arr=(cryptoio);
	echo 'default array= ' ${arr[@]};
fi
        echo ' Packing : ' ${arr[@]};

for git in ${arr[@]}; do
#	    [ "$DEMO" = 5 ]
#       [[ $DEMO == 10 ]]
        tmp_path1='code';
        tmp_path2='code/theme';
        if [[ -d $path_git_theme/${git}/$tmp_path1/plugins/ ]]; then
            open_changelog $tmp_path1;
            accept;
            pack_theme $tmp_path1;

            elif [[ -d $path_git_theme/${git}/$tmp_path2/plugins/ ]]; then
            open_changelog $tmp_path1;
            accept;
            pack_theme $tmp_path2;
        fi
           # mkdir /home/thang/themesubmit/${git};
           # cd /home/thang/themesubmit/${git};
           # cp -r $path_git_theme/${git}/code/theme ${git};
           # zip -r ${git}.zip ${git};

done
