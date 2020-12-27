function tr4!(r::Robot)#главная функция
    move_corner(r)#перемещаем робота в угол 
    mark!(r)
end
function mark!(r::Robot)
    for i in 1:11
        for i in i:11
            if isborder(r, Ost) == false
                putmarker!(r)
                move!(r, Ost)
            end
        end
        putmarker!(r)
        for i in i:11
            if isborder(r, West) == false
                move!(r, West)
            end
        end 
        if isborder(r,Nord) == false
            move!(r,Nord)
        end
        i=i+1
    end
end
function move_corner(r::Robot) #перемещаем робота в угол 
    while isborder(r, West) == false
        move!(r, West)
    end
    while isborder(r, Sud) == false
        move!(r, Sud)
    end
end
