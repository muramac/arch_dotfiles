function fish_prompt
    # Используем тёмно-фиолетовый цвет (purple) для имени пользователя и хоста
    set_color --bold purple
    echo -n (whoami) "@" (hostname|cut -d '.' -f1)
    set_color normal
    echo -n " "
    
    # Текущая директория в светло-фиолетовом цвете
    set_color --bold purple  # индекс цвета для светло-фиолетового в 256-цветах
    echo -n (prompt_pwd)
    set_color normal
    echo -n " "
    
    # Символ prompt зелёного цвета
    set_color --bold purple
    echo -n "❯"
    set_color normal
end


# Created by `pipx` on 2026-08-03 12:11:42
set PATH $PATH /home/drew/.local/bin
