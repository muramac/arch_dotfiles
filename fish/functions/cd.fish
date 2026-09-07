function cd --description 'Change directory and list files'
    builtin cd $argv; and ls -a
end
