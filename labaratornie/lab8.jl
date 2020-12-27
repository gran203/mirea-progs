function tr8!(r)#главная функция
    side=Ost
    while isborder(r,Nord)==true # прохода сверху нет
        putmarker!(r)
        move_by_markers!(r,side)
        side=inverse(side)
    end
end

move_by_markers(r::Robot,side::HorizonSide) = 
    while ismarker(r)==true 
        move!(r,side) 
    end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))