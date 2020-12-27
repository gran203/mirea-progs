function tr2!(r::Robot) #главная функция
    for side in (Nord, West, Sud, Ost) # - перебор всех возможных направлений
        move_corner(r, side)# перемещаем робота в угол 
        put_a_marker(r, side)#ставим маркер
    end
    show!(r)
end
function put_a_marker(r::Robot, side::HorizonSide)#ставим маркер 
    for side in (Ost, Sud, West, Nord)
        while isborder(r, side) == false
            putmarker!(r)   
            move!(r, side)     
        end
    end
end
function move_corner(r::Robot, side::HorizonSide) # перемещаем робота в угол 
    while isborder(r, Nord) == false
        move!(r, Nord)
    end
end