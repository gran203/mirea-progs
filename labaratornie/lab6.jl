function tr6!(r::Robot)#главная функция
    side=Sud
    side_to_border=Ost
    side_of_movement=Nord
    vert=0
    hor=0
    vert_1=0
    hor_1=0
    while isborder(r,side)==false
    move!(r,side)
    vert=vert + 1
    end
    side=next_move(side)
    while isborder(r,side)==false
    move!(r,side)
    hor=hor + 1
    end
    side=Sud
    while isborder(r,side)==false
    move!(r,side)
    vert_1=vert_1 + 1
    end
    side=next_move(side)
    while isborder(r,side)==false
    move!(r,side)
    hor_1=hor_1 + 1
    end
    find_border!(r,side_to_border,side_of_movement)
    #Поиск перегородки
    mark_perimetr!(r,side_to_border,side_of_movement)
    #Маркировка перегородки
    side=West
    while isborder(r,side)==false
    move!(r,side)
    end
    side=next_move(side)
    while isborder(r,side)==false
    move!(r,side)
    end
    side=Sud
    while isborder(r,side)==false
    move!(r,side)
    end
    side=next_move(side)
    while isborder(r,side)==false
    move!(r,side)
    end
    #Робот снова в углу
    side=Ost
    movements!(r,side,hor_1)
    side=Nord
    movements!(r,side,vert_1)
    side=Ost
    movements!(r,side,hor)
    side=Nord
    movements!(r,side,vert)
    #Перемещение робота по запомненному пути
    
    
    end
    
    function find_border!(r::Robot,side_to_border::HorizonSide, side_of_movement::HorizonSide)
    while isborder(r,side_to_border)==false
    if isborder(r,side_of_movement)==false
    move!(r,side_of_movement)
    else
    move!(r,side_to_border)
    side_of_movement=inverse(side_of_movement)
    end
    end
    end
    
    function find_corner!(r::Robot,side::HorizonSide)
    vert=0
    hor=0
    vert_1=0
    hor_1=0
    while isborder(r,side)==false
    move!(r,side)
    end
    side=next_move(side)
    while isborder(r,side)==false
    move!(r,side)
    end
    side=Sud
    while isborder(r,side)==false
    move!(r,side)
    end
    side=next_move(side)
    while isborder(r,side)==false
    move!(r,side)
    end
    end
    
    function mark_perimetr!(r::Robot,side_to_border::HorizonSide, side_of_movement::HorizonSide)
    for i ∈ 1:4
    while isborder(r,side_to_border)==true
    putmarker!(r)
    move!(r,side_of_movement)
    end
    side_to_border=next_bord(side_to_border)
    side_of_movement=next_move(side_of_movement)
    putmarker!(r)
    movements!(r,side_of_movement,1)
    i=i+1
    end
    end
    
    inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
    
    next_bord(side_to_border::HorizonSide)=HorizonSide(mod(Int(side_to_border)+3,4))
    
    next_move(side_of_movement::HorizonSide)=HorizonSide(mod(Int(side_of_movement)+3,4))
    
    movements!(r::Robot,side::HorizonSide,vert::Int)=
    for i in 1:vert
    move!(r,side)
    end