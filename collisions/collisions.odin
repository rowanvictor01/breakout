package collisions

import "vendor:raylib"
import "core:fmt"

import "../entities"
import "../init"


WIN_LEFT :: 0
WIN_RIGHT :: init.WIN_WIDTH
WIN_TOP :: 0
WIN_BOTTOM :: init.WIN_HEIGHT


collision_paddle_border :: proc(paddle: ^entities.Paddle)
{
    // Paddle Sides
    paddle_left := paddle.x
    paddle_right := paddle.x + f32(paddle.width)
    paddle_top := paddle.y
    paddle_bottom := paddle.y + f32(paddle.height)
    
    if paddle_left <= WIN_LEFT {paddle.x = WIN_LEFT}
    if paddle_right >= WIN_RIGHT {paddle.x = WIN_RIGHT - f32(paddle.width)}
}
