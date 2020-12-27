function tr3!(r::Robot)#главная функция
    move_corner(r)#перемещаем робота в угол 
    put_a_marker(r)#ставим маркер 
    show!(r)#показать 
end
function put_a_marker(r::Robot)#ставим маркер 
    while ismarker(r) == false
        while isborder(r, Sud) == false
            putmarker!(r)
            move!(r, Sud)
        end
        if isborder(r, Ost) == false
            putmarker!(r)
            move!(r, Ost)
        end
        while isborder(r, Nord) == false
            putmarker!(r)
            move!(r, Nord)
        end
        if isborder(r, Ost) == false
            putmarker!(r)
            move!(r, Ost)
        end
    end
end
function move_corner(r::Robot) #перемещаем робота в угол 
    while isborder(r, Nord) == false
        move!(r, Nord)
    end
    while isborder(r, West) == false
        move!(r, West)
    end
end