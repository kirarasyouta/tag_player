require 'dxruby'

Window.width = 1920
Window.height = 1200
Window.windowed = false

walls = [
    Sprite.new(0, 0, Image.new(1920, 20, C_GREEN)),
    Sprite.new(0, 0, Image.new(20, 1200, C_GREEN)),
    Sprite.new(1900, 0, Image.new(20, 1200, C_GREEN)),
    Sprite.new(0, 1180, Image.new(1920, 20, C_GREEN)),
]
move_walls = [
    Sprite.new(20, 1180, Image.new(240, 20, C_RED)),
    Sprite.new(840, 1180, Image.new(220, 20, C_RED))
]
move_walls2 = [
    Sprite.new(440, 1180, Image.new(220, 20, C_YELLOW)),
    Sprite.new(1040, 1180, Image.new(220, 20, C_YELLOW))
]
move_walls3 = [
    Sprite.new(240, 700, Image.new(220, 20, C_GREEN))
]
move_walls4 = [
    Sprite.new(1680, 960, Image.new(220, 20, [255, 0, 255]))
]
move_walls5 = [
    Sprite.new(1640, 980, Image.new(20, 200, [0, 255, 255]))
]

player1_walls = [
    Sprite.new(240, 980, Image.new(20, 200, C_WHITE)),
    Sprite.new(640, 980, Image.new(20, 200, C_WHITE)),
    Sprite.new(1040, 980, Image.new(20, 200, C_WHITE)),
    Sprite.new(1440, 980, Image.new(20, 200, C_WHITE))
]
player2_walls = [
    Sprite.new(440, 980, Image.new(20, 200, C_BLUE)),
    Sprite.new(840, 980, Image.new(20, 200, C_BLUE)),
    Sprite.new(1240, 980, Image.new(20, 200, C_BLUE))
]

player1 = Sprite.new(130, 1080, Image.new(100, 100, C_WHITE))
player2 = Sprite.new(20, 1080, Image.new(100, 100, C_BLUE))
player_spead = 5

item = [
    Sprite.new(300, 1160, Image.new(40, 20, C_RED)),
    Sprite.new(700, 1160, Image.new(40, 20, C_RED))
]
item2 = [
    Sprite.new(50, 1160, Image.new(40, 20, C_YELLOW)),
    Sprite.new(900, 1160, Image.new(40, 20, C_YELLOW)),
    Sprite.new(1300, 1160, Image.new(40, 20, C_YELLOW))
]
item3 = [
    Sprite.new(500, 1160, Image.new(40, 20, C_GREEN))
]
item4 = [
    Sprite.new(200, 1160, Image.new(40, 20, C_GREEN))
]
item5 = [
    Sprite.new(1100, 1160, Image.new(40, 20, [255, 0, 255]))
]
item6 = [
    Sprite.new(1500, 1160, Image.new(40, 20, [0, 255, 255]))
]

goal = Sprite.new(1700, 980,Image.new(200, 200, [255, 140, 0]))

move_ground = false
move_ground2 = false
move_ground3 = false
move_ground4 = false
move_ground5 = false

game_start = true
win = false

Window.loop do
    if game_start
        Window.draw_font(100, 100, "えんたですたと\n\nるーる\n自分と同じ色の壁は進むことが出来ません、戻ることは出来ます
        \n知恵を駆使してゴールまで辿り着いて下さい", Font.default)
        if Input.key_push?(K_RETURN)
            game_start = false
        end
    elsif win
        Window.draw_font(300, 300, "クリアおめでとう！！", Font.default)
    else
        Sprite.draw(walls)
        Sprite.draw(move_walls)
        Sprite.draw(move_walls2)
        Sprite.draw(move_walls3)
        Sprite.draw(move_walls4)
        Sprite.draw(move_walls5)
        Sprite.draw(player1_walls)
        Sprite.draw(player2_walls)
        player1.draw
        player2.draw
        goal.draw
        Sprite.draw(item)
        Sprite.draw(item2)
        Sprite.draw(item3)
        Sprite.draw(item4)
        Sprite.draw(item5)
        Sprite.draw(item6)

        if Input.key_down?(K_RIGHT)
            player1.x += player_spead
        end
        if Input.key_down?(K_LEFT)
            player1.x -= player_spead
        end
        if Input.key_down?(K_D)
            player2.x += player_spead
        end
        if Input.key_down?(K_A)
            player2.x -= player_spead
        end

        player1.y += 5
        if player1.y >= 1080
            player1.y = 1080
        end
        if player1.x <= 20
            player1.x = 20
        end
        if player1.x >= 1900
            player1.x = 1900
        end
        player2.y += 5
        if player2.y >= 1080
            player2.y = 1080
        end
        if player2.x <= 20
            player2.x = 20
        end
        if player2.x >= 1900
            player2.x = 1900
        end

        if player1 === player1_walls
            player1.x -= player_spead
        end
        if player2 === player2_walls
            player2.x -= player_spead
        end
        if player1 === move_walls
            player1.y -= 6
        end
        if player2 === move_walls
            player2.y -= 6
        end
        if player1 === move_walls2
            player1.y -= 6
        end
        if player2 === move_walls2
            player2.y -= 6
        end
        if player1 === move_walls3
            player1.y -= 6
        end
        if player2 === move_walls3
            player2.y -= 6
        end
        if player1 === move_walls4
            player1.y -= 6
        end
        if player2 === move_walls4
            player2.y -= 6
        end
        if player1 === move_walls5
            player1.x -= player_spead
        end
        if player2 === move_walls5
            player2.x -= player_spead
        end

        if move_ground
            move_walls.each do |obj|
                if obj.y > 960
                    obj.y -= 1
                end
            end
        else
            move_walls.each do |obj|
                if obj.y < 1180
                    obj.y += 1
                end
            end
        end
        if move_ground2
            move_walls2.each do |obj|
                if obj.y > 960
                    obj.y -= 1
                end
            end
        else
            move_walls2.each do |obj|
                if obj.y < 1180
                    obj.y += 1
                end
            end
        end
        if move_ground3
            move_walls3.each do |obj|
                if obj.y < 960
                    obj.y += 1
                end
            end
        else
            move_walls3.each do |obj|
                if obj.y > 700
                    obj.y -= 1
                end
            end
        end
        if move_ground4
            move_walls4.each do |obj|
                if obj.x > 640
                    obj.x -= 5
                end
            end
        else
            move_walls4.each do |obj|
                if obj.x < 1680
                    obj.x += 5
                end
            end
        end
        if move_ground5
            move_walls5.each do |obj|
                if obj.y < 1180
                    obj.y += 1
                end
            end
            player1_walls.each do |obj|
                if obj.y < 1180
                    obj.y += 1
                end
            end
        end

        if player1 === item || player2 === item
            move_ground = true
        else
            move_ground = false
        end
        if player1 === item2 || player2 === item2
            move_ground2 = true
        else
            move_ground2 = false
        end

        if player1 === item3 || player2 === item3
            move_ground3 = true
        end
        if player1 === item4 || player2 === item4
            move_ground3 = false
        end
        if player1 === item5 || player2 === item5
            move_ground4 = true
        end
        if player1 === item6 || player2 === item6
            move_ground5 = true
        end

        if player1 === goal && player2 === goal
            win = true
        end

        Window.draw_font(100, 100, "#{move_ground}", Font.default)
    end
    break if Input.key_push?(K_ESCAPE)
end